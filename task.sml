exception NoAnswer

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


    (*4*)
fun longest_string_helper f = 
        List.foldl(
                    fn(str1, str2) => if (f(String.size(str1), String.size(str2))) 
                                                            then str2 
                                                            else str1
                ) "";
val longest_string3 = longest_string_helper( fn(str1, str2) => str2 >= str1 );
val longest_string4 = longest_string_helper( fn(str1, str2)=> str2 > str1 );

longest_string3(["adc", "ab", "abvf", "addc"]);
longest_string4(["adc", "ab", "abvf", "addc"]);


    (*5*)
val longest_capitalized  =  longest_string1 o only_capitals;

longest_capitalized(["adc", "ab", "abvf", "addc"]);
longest_capitalized(["adc", "Ab", "abvf", "Addc"]);
longest_capital   


    (*6*)
val rev_string = String.implode o List.rev o String.explode;

rev_string("Str");
