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
    
