val test1_1 = is_older((2012,2,28),(2012,2,28)) = false
val test1_2 = is_older((2012,2,28),(2011,3,31)) = false
val test1_3 = is_older((2012,2,28),(3011,1,1)) = true
val test1_4 = is_older((2012,11,30),(2012,2,28)) = false
val test1_5 = is_older((2012,2,28),(2012,2,29)) = true

val test2_1 = number_in_month([(2012,2,28),(2013,12,1),(1,2,1)],2) = 2
val test2_2 = number_in_month([(1,9,28),(2013,11,1)],2) = 0
val test2_3 = number_in_month([(2012,2,28),(2100,2,1),(3,2,3)],2) = 3
val test2_4 = number_in_month([(2012,2,28),(2100,2,1),(3,2,3),(2100,2,1),(3,2,3),(2100,2,1),(3,2,3),(2100,2,1),(3,2,3)],2) = 9

val test3_1 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test3_2 = number_in_months([(2012,4,28),(2013,4,1),(2011,4,31),(2011,4,28)],[2,3,4]) = 4
val test3_3 = number_in_months([(2012,1,28),(2013,1,1),(2011,1,31),(2011,1,28)],[2,3,4]) = 0

val test4_1 = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test4_2 = dates_in_month([(2012,12,28),(2013,12,1)],2) = []
val test4_3 = dates_in_month([(2012,2,28),(2013,2,1),(1,2,28)],2) = [(2012,2,28),(2013,2,1),(1,2,28)]

val test5_1 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test5_2 = dates_in_months([(2012,2,28),(2013,2,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2013,2,1),(2011,3,31),(2011,4,28)]
val test5_3 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1]) = []

val test6_1 = get_nth(["hi", "there", "how", "are", "you"], 2) = "there"
val test6_2 = get_nth(["hi", "there", "how", "are", "you"], 5) = "you"
val test6_3 = get_nth(["hi", "there", "how", "are", "you"], 7) = ""
val test6_4 = get_nth([], 2) = ""
val test6_5 = get_nth(["aa"], ~1) = ""
val test6_6 = get_nth(["aa"], 1) = "aa"
val test6_7 = get_nth(["aa"], 0) = ""