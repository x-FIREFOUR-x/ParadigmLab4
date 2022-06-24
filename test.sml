use "task.sml";

val t1_1 = only_capitals(["gfggf", "Gsgsg", "Hdhhd"]);
val t1_2 = only_capitals([]);

val t2_1 = longest_string1(["adc", "ab", "abvf", "addc"]);
val t2_2 = longest_string1([]);

val t3_1 = longest_string2(["adc", "ab", "abvf", "addc"]);
val t3_2 = longest_string2([]);

val t4_1 = longest_string3(["adc", "ab", "abvf", "addc"]);
val t4_2 = longest_string4(["adc", "ab", "abvf", "addc"]);

val t5_1 = longest_capitalized(["adc", "ab", "abvf", "addc"]);
val t5_2 = longest_capitalized(["adc", "Ab", "abvf", "Addc"]);

val t6_1 = rev_string("Str");
val t6_2 = rev_string("");

val t7_1 = first_answer(fn a => if a > 3 then SOME a else NONE) [2, 0, 3, 6, 5];
val t7_2 = first_answer(fn a => if a = 0 then SOME a else NONE) [2, 0, 3, 6, 5];

val t8_1 = all_answers(fn a => if a = 2 then NONE else SOME[a]) [1, 2, 4];
val t8_2 = all_answers(fn a => if a = 0 then NONE else SOME[a]) [1, 2, 4];

val t9a_1 = count_wildcards(ConstP 5);
val t9a_2 = count_wildcards(TupleP [Wildcard, ConstP 5, UnitP, Wildcard]);
val t9a_3 = count_wildcards(TupleP [Wildcard, Wildcard, ConstructorP("Str", TupleP [Wildcard, Wildcard, UnitP]) ] );

val t9b_1 = count_wild_and_variable_lengths(Variable "");
val t9b_2 = count_wild_and_variable_lengths(Variable "Str");
val t9b_3 = count_wild_and_variable_lengths(TupleP [Wildcard, ConstructorP("Str", TupleP [Wildcard]) ] );
val t9b_4 = count_wild_and_variable_lengths(TupleP [Wildcard, ConstructorP("Str", TupleP [Wildcard, Variable "DD"]) ] );

val t9c_1 = count_some_var("AB", (TupleP ([Variable("ABC")])));
val t9c_2 = count_some_var("ABC", (TupleP ([Variable("ABC")])));
val t9c_3 = count_some_var("ABC", (TupleP ([Variable("ABC"), TupleP [Wildcard, Variable "ABC"]])));


val t10_1 = check_pat(TupleP [Variable "abc", Wildcard, ConstructorP("Str", TupleP [Variable "abc", UnitP]) ] );
val t10_2 = check_pat(TupleP [Variable "abc", Wildcard, ConstructorP("Str", TupleP[UnitP]) ] );

val t11_1 = match(Unit, Wildcard);
val t11_2 = match(Const 1, ConstP 1);
val t11_3 = match(Const 1, ConstP 2);
val t11_4 = match(Unit, UnitP);
val t11_5 = match(Constructor("Str", Unit), ConstructorP("Str", UnitP));
val t11_6 = match(Constructor("Str", Unit), ConstructorP("Str2", UnitP));
val t11_7 = match(Constructor("Str", Unit), ConstructorP("Str2", Wildcard));
val t11_8 = match(Tuple[Unit, Const 1], TupleP[UnitP, ConstP 1]);
val t11_9 = match(Tuple[Unit, Const 0], TupleP[UnitP, ConstP 1]);
val t11_10 = match(Tuple[Unit, Const 0], Variable "ddd");