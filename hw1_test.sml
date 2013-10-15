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

val test7_1 = date_to_string((2013, 6, 1)) = "June 1, 2013"
val test7_2 = date_to_string((1, 1, 1)) = "January 1, 1"
val test7_3 = date_to_string((9999, 12, 31)) = "December 31, 9999"

val test8_1 = number_before_reaching_sum(10, [1,2,3,4,5]) = 3
val test8_2 = number_before_reaching_sum(1, [2,8,3,4,5]) = 0
val test8_3 = number_before_reaching_sum(30, [1,2,3,4,5]) = 5
val test8_4 = number_before_reaching_sum(30, [1]) = 1

val test9_1 = what_month(70) = 3
val test9_2 = what_month(1) = 1
val test9_3 = what_month(365) = 12
val test9_4 = what_month(120) = 4

val test10_1 = month_range(31, 34) = [1,2,2,2]
val test10_2 = month_range(31, 31) = [1]
val test10_3 = month_range(33, 31) = []
val test10_4 = month_range(120, 125) = [4,5,5,5,5,5]

val test11_1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test11_2 = oldest([]) = NONE
val test11_3 = oldest([(2011,3,31)]) = SOME (2011,3,31)
val test11_4 = oldest([(2012,2,28),(2011,3,31),(2011,4,28),(1,1,1)]) = SOME (1,1,1)