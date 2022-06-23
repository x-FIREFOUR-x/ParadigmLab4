
    (*1*)
fun only_capitals(list_str: string list) = 
        List.filter(fn str => Char.isUpper(String.sub(str, 0))) list_str;

only_capitals(["gfggf", "Gsgsg", "Hdhhd"]);


    (*2*)
fun longest_string1(list_str: string list) = 
        List.foldl(
                    fn(str1, str2) => if (String.size(str2) >= String.size(str1))
                                        then str2
                                        else str1
                ) "" list_str;

longest_string1(["adc", "ab", "abvf", "addc"]);


    (*3*)
fun longest_string2(list_str: string list) = 
        List.foldl(
                    fn(str1, str2) => if (String.size(str2) > String.size(str1))
                                        then str2
                                        else str1
                ) "" list_str;

longest_string2(["adc", "ab", "abvf", "addc"]);