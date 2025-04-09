# 打开文件并读取数据
read_file_path = "/public/zjy/memoryAddress.txt"  # 替换为你的文件路径
out_file_path = "/public/zjy/output.txt"

rows = 128
cols = 8

numbers = []

tag = [[0 for _ in range(cols)] for _ in range(rows)]
valid = [[0 for _ in range(cols)] for _ in range(rows)]
lru = [[0 for _ in range(cols)] for _ in range(rows)]

with open(read_file_path, "r", encoding="utf-8") as file:
    for line in file:
        number = int(line.strip(),2)
        #print(number)
        numbers.append(number)

loadstore = [] #1是，0不是
hit_32B = [] #1命中，0缺失
hit_num_32B = []
index_out_32B = []
hit_64B = 0 #1命中，0缺失
hit_num_64B = []
index_out_64B = []

#命中更新
def lru_hit(hit_num, addr_index):#命中哪一行，第几组
    lru_p_state = lru[addr_index]
    
    #找hit是第几个
    hit_num_dex = 0
    for i in range(8):
        if hit_num[i]==1:
            hit_num_dex = i
            break
    hit_lrunum = lru_p_state[i]

    #更新，相等的变MRU（lru位=0）,小于的+1，大于的不变
    for i in range(len(lru_p_state)):
        if lru_p_state[i] == hit_lrunum:
            lru[addr_index][i] = 0
        elif lru_p_state[i] < hit_lrunum:
            lru[addr_index][i] = lru_p_state[i]+1

#缺失更新
def lru_miss(addr_index, addr_tag):#第几组，缺失写入的tag
    lru_p_state = lru[addr_index]
    
    #更新，等于7的变MRU（lru位=0）,其他的+1；新tag写入
    for i in range(len(lru_p_state)):
        if lru_p_state[i]==7:
            tag[addr_index][i] = addr_tag
            lru[addr_index][i] = 0
        else:
            lru[addr_index][i] = lru_p_state[i]+1

lenth = len(numbers)
for line in range(lenth):
    if line != 0 and numbers[line] == 0:
        a1 = [0 for _ in range(cols)]
        hit_num_32B.append(a1)
        index_out_32B.append(0)
        hit_32B.append(0)
        loadstore.append(0)
        print(0,0)
        continue

    addr_32B = numbers[line] >> 5
    Index_32B = addr_32B % 128
    print(addr_32B,Index_32B)
    tag_32B = addr_32B / 128

    hit = 0
    now_hit_num_32B = [0 for _ in range(cols)]
    
    #比较组内8行
    for i in range(8):
        if tag[Index_32B][i] == tag_32B and valid[Index_32B][i] == 1:
            hit = 1
            now_hit_num_32B[i] = 1 #如果未命中，则缺失；命中则给出命中独热码
            break
    
    if hit==0:
        a1 = [0 for _ in range(cols)]
        hit_num_32B.append(a1)
        index_out_32B.append(0)
        #检查是否有valid为0，有则直接写入
        flag=0
        for i in range(8):
            if valid[Index_32B][i] == 0:
                valid[Index_32B][i]=1
                tag[Index_32B][i]=tag_32B
                lru[Index_32B][i]=7-i
                flag=1
        #无valid为0，缺失处理
        if flag == 0:
            lru_miss(Index_32B ,tag_32B)
    elif hit==1:
        hit_num_32B.append(now_hit_num_32B)
        index_out_32B.append(Index_32B)
        lru_hit(now_hit_num_32B,Index_32B)
    hit_32B.append(hit)
    loadstore.append(1)

binary_strings = [''.join(map(str, sublist)) for sublist in hit_num_32B]

with open(out_file_path, "w", encoding="utf-8") as file:
    for x,y,hit_num,index in zip(loadstore, hit_32B, binary_strings, index_out_32B):
        file.write(f"{x} {y} {hit_num} {index}\n")
    
print(f"数据已写入文件 {out_file_path}")