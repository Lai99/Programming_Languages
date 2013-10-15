(* is_older function *)  
fun is_older(date1 : int*int*int, date2 : int*int*int) = 
    if #1 date1 < #1 date2 
    then true
    else
        if #1 date1 > #1 date2
        then false
        else
            if #2 date1 < #2 date2 
            then true
            else 
                if #2 date1 > #2 date2
                then false
                else
                    if #3 date1 < #3 date2
                    then true
                    else false

(* number_in_month function *)
fun number_in_month(dates : (int*int*int) list, month_match : int) =
    let 
        fun find_month(dates : (int*int*int) list) =    
            if null dates 
            then 0
            else 
                if #2 (hd dates) = month_match
                then 
                    1 +  find_month(tl dates)
                else
                    find_month(tl dates)
    in 
        find_month(dates)
    end

(* number_in_months functon *)
fun number_in_months(dates : (int*int*int) list, months_match : int list) = 
    let 
        fun find_months(months_match : int list) = 
            if null months_match
            then 0   
            else
                number_in_month(dates, hd months_match) + find_months(tl months_match)
    in  
        find_months(months_match)
    end

(* dates_in_month function *)
fun dates_in_month(dates : (int*int*int) list, month_match : int) = 
    let 
        fun find_month(dates : (int*int*int) list) =    
            if null dates 
            then []
            else 
                if #2 (hd dates) = month_match
                then 
                    hd dates :: find_month(tl dates)
                else
                    find_month(tl dates)
    in 
        find_month(dates)
    end    

(* dates_in_months function *)
fun dates_in_months(dates : (int*int*int) list, months_match : int list) =
    let 
        fun find_months(months_match : int list) = 
            if null months_match
            then []   
            else
                dates_in_month(dates, hd months_match) @ find_months(tl months_match)
    in  
        find_months(months_match)
    end    

(* get_nth function *)
fun get_nth(str_list : string list, nth : int) = 
    if null str_list orelse nth < 1
    then ""
    else    
	let
            fun nth_str(str_list : string list, n : int) = 
		if null (tl str_list) andalso n > 1
		then ""
		else            
                    if n = 1
                    then hd str_list
                    else
			nth_str(tl str_list, n - 1)
	in
            nth_str(str_list, nth)
	end 

(* date_to_string function *)
fun date_to_string(date : int*int*int) =     
    get_nth(["January","February","March","April","May","June","July","August","September","October","November","December"], (#2 date)) ^ " " ^  Int.toString(#3 date) ^ ", " ^  Int.toString(#1 date)

(* number_before_reaching_sum function *)
fun number_before_reaching_sum(bound : int, numbers : int list) =    
    let
        fun sum(numbers : int list, total) = 
            if bound <= total
	    then 0
	    else
                if null (tl numbers)
                then 1
                else             
                    1 + sum(tl numbers, total + hd(tl numbers))
    in
        sum(numbers, hd numbers)
    end 
        
(* what_month function *)
fun what_month(day : int) = 
    number_before_reaching_sum(day, [31,28,31,30,31,30,31,31,30,31,30,31])+1

(* month_range function *)
fun month_range(day1 : int, day2 : int) =
    if day1 > day2
    then []
    else
        what_month(day1)::month_range(day1+1,day2)
            
(* oldest function *)
fun oldest(dates : (int*int*int) list) = 
    if null dates
    then NONE
    else
        let val oldest_day = oldest(tl dates)
        in 
            if isSome oldest_day andalso is_older(valOf oldest_day, hd dates)
            then oldest_day
            else SOME (hd dates)    
        end

(* number_in_months_challenges function *)
fun number_in_months_challenges(dates : (int*int*int) list, months_match : int list) =
    let
        fun keep_not_same(m_list : int list, match : int) =
            if null m_list
            then []
            else
                if match = hd m_list
                then keep_not_same(tl m_list, match)
                else hd m_list::keep_not_same(tl m_list, match)

        fun new_match(m_list : int list) =
            if null m_list
            then []
            else
                hd m_list::new_match(keep_not_same(tl m_list, hd m_list))
    in
        number_in_months(dates,new_match(months_match))
    end
