
    (*1*)
fun only_capitals(list_str: string list) = 
        List.filter(fn str => Char.isUpper(String.sub(str, 0))) list_str

only_capitals(["gfggf", "Gsgsg", "hdhhd"])
