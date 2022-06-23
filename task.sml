use "hw03.sml";

    (*1*)
fun only_capitals(list_str: string list) = 
        List.filter(fn str => Char.isUpper(String.sub(str, 0))) list_str;

val t1 = only_capitals(["gfggf", "Gsgsg", "Hdhhd"]);


    (*2*)
fun longest_string1(list_str: string list) = 
        List.foldl(
                    fn(str1, str2) => if (String.size(str2) >= String.size(str1))
                                        then str2
                                        else str1
                ) "" list_str;

val t2 = longest_string1(["adc", "ab", "abvf", "addc"]);


    (*3*)
fun longest_string2(list_str: string list) = 
        List.foldl(
                    fn(str1, str2) => if (String.size(str2) > String.size(str1))
                                        then str2
                                        else str1
                ) "" list_str;

val t3 = longest_string2(["adc", "ab", "abvf", "addc"]);


    (*4*)
fun longest_string_helper f = 
        List.foldl(
                    fn(str1, str2) => if (f(String.size(str1), String.size(str2))) 
                                                            then str2 
                                                            else str1
                ) "";
val longest_string3 = longest_string_helper( fn(str1, str2) => str2 >= str1 );
val longest_string4 = longest_string_helper( fn(str1, str2)=> str2 > str1 );

val t4 = longest_string3(["adc", "ab", "abvf", "addc"]);
val t4 = longest_string4(["adc", "ab", "abvf", "addc"]);


    (*5*)
val longest_capitalized  =  longest_string1 o only_capitals;

val t5 = longest_capitalized(["adc", "ab", "abvf", "addc"]);
val t5 = longest_capitalized(["adc", "Ab", "abvf", "Addc"]);


    (*6*)
val rev_string = String.implode o List.rev o String.explode;

val t6 = rev_string("Str");


    (*7*)
fun first_answer f list = 
    case list of
	    [] => raise NoAnswer
        | hd :: tl => case f(hd) of
		                SOME v => v
		                | NONE => first_answer f tl;


(*first_answer (fn a => NONE) [1, 2, 3];*)
val t7 = first_answer (fn a => if a > 3 then SOME a else NONE) [2, 0, 3, 6, 5];


    (*8*)
fun all_answers f list =
    let
        fun fun_help list acc = 
            case list of
                [] => SOME acc
                | hd::tl => case f(hd) of
                                NONE => NONE
                                | SOME v => fun_help tl (acc @ v)
    in
        fun_help list []
    end;


val t8 = all_answers (fn a => if a = 2 then NONE else SOME[a]) [1, 2, 4];
val t8 = all_answers (fn a => if a = 0 then NONE else SOME[a]) [1, 2, 4];



    (*9*)

    (*9a*)
fun count_wildcards(p: pattern) = 
    g (fn v => 1) (fn v => 0) p

val t9a = count_wildcards(ConstP 5);
val t9a = count_wildcards(TupleP [Wildcard, ConstP 5, UnitP, Wildcard]);
val t9a = count_wildcards(TupleP [Wildcard, Wildcard, ConstructorP("Str", TupleP [Wildcard, Wildcard, UnitP]) ] );


    (*9b*)
fun count_wild_and_variable_lengths(p: pattern) =
     g (fn a => 1) (String.size) p;

val t9b = count_wild_and_variable_lengths(TupleP [Wildcard, ConstructorP("Str", TupleP [Wildcard]) ] );
val t9b = count_wild_and_variable_lengths(TupleP [Wildcard, ConstructorP("Str", TupleP [Wildcard, Variable "DD"]) ] );


    (*9c*)
fun count_some_var(str: string, p: pattern) =
    g (fn a => 0) (fn b => if b = str then 1 else 0) p;

val t9c = count_some_var("DDd", TupleP [Variable "abc", Wildcard, Wildcard, ConstructorP("Str", TupleP [Wildcard, UnitP]) ] );
val t9c = count_some_var("abc", TupleP [Variable "abc", Wildcard, Wildcard, ConstructorP("Str", TupleP [Wildcard, UnitP]) ] );
val t9c = count_some_var("abc", TupleP [Variable "abc", Wildcard, Wildcard, ConstructorP("Str", TupleP [Variable "abc", UnitP]) ] );
