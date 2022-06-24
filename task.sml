use "hw03.sml";

    (*1*)
fun only_capitals(list_str: string list) = 
        List.filter(fn str => Char.isUpper(String.sub(str, 0))) list_str;



    (*2*)
fun longest_string1(list_str: string list) = 
        List.foldl(
                    fn(str1, str2) => if (String.size(str2) >= String.size(str1))
                                        then str2
                                        else str1
                ) "" list_str;



    (*3*)
fun longest_string2(list_str: string list) = 
        List.foldl(
                    fn(str1, str2) => if (String.size(str2) > String.size(str1))
                                        then str2
                                        else str1
                ) "" list_str;



    (*4*)
fun longest_string_helper f = 
        List.foldl(
                    fn(str1, str2) => if (f(String.size(str1), String.size(str2))) 
                                                            then str2 
                                                            else str1
                ) "";
val longest_string3 = longest_string_helper( fn(str1, str2) => str2 >= str1 );
val longest_string4 = longest_string_helper( fn(str1, str2)=> str2 > str1 );



    (*5*)
val longest_capitalized  =  longest_string1 o only_capitals;



    (*6*)
val rev_string = String.implode o List.rev o String.explode;



    (*7*)
fun first_answer f list = 
    case list of
	    [] => raise NoAnswer
        | hd :: tl => case f(hd) of
		                SOME v => v
		                | NONE => first_answer f tl;



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



    (*9*)

    (*9a*)
fun count_wildcards(p: pattern) = 
    g (fn v => 1) (fn v => 0) p


    (*9b*)
fun count_wild_and_variable_lengths(p: pattern) =
     g (fn a => 1) (String.size) p;


    (*9c*)
fun count_some_var(str: string, p: pattern) =
    g (fn a => 0) (fn b => if b = str then 1 else 0) p;



    (*10*)
fun check_pat (p: pattern) =
    let 
        fun get_list_variables(p: pattern) =
	        case p of
	            Variable x => [x]
	            | TupleP tup => List.foldl(fn (p,ps) => ps @ get_list_variables(p)) [] tup
	            | ConstructorP(_,p) => get_list_variables(p)
	            | _  => []

        fun check_repeats(list: string list) =
            case list of
                [] => true
                | hd::tl => if List.exists(fn a => a = hd) tl 
                                then false 
                                else check_repeats(tl)
    in
        check_repeats(get_list_variables(p))
    end;
 


    (*11*)
fun match (value, patern) =
     case (value, patern) of  
        (_, Wildcard) => SOME []
        | (_, Variable s) => SOME [(s, value)]
        | (Unit, UnitP) => SOME []
        | (Const v1, ConstP p1) => if v1 = p1 
                                    then SOME [] 
                                    else NONE
        | (Constructor(str, v1), ConstructorP(strP, p1)) => if str = strP 
                                                                then match(v1, p1) 
                                                                else NONE
        | (Tuple tupV, TupleP tupP) => if List.length tupV = List.length tupP 
                                        then case all_answers match(ListPair.zip(tupV, tupP)) of
                                            SOME v1 => SOME v1
                                            |_ => NONE
                                        else NONE
        | _ => NONE;

