*! 在 Stata 中创建一个恋爱计时器
*! 微信公众号 RStata 2023 年 8 月 20 日
*! 【用法】：
*! 		lovingtimer string, [TItle(string) FIrstday(string) BGColor(string) TITLEFontfamily(string) TIMERFontfamily(string) SPANFontfamily(string) SAVEhtml(string)]
*! 【选项】：
*!		title: Title.
*!		firstday: The first day of love. For example, "2023-01-01 01:00:00".
*!		bgcolor: background-color.
*!		titlefontfamily: Title font family.
*!		timerfontfamily: Timer font family.
*!		spanfontfamily: Font for numbers.
*!		savehtml: file name to be saved.
*! 【示例】：
*! 	lovingtimer, ti("From the first day to the future") firstday "2023-01-01 01:00:00" 
cap prog drop lovingtimer 
prog def lovingtimer 
	syntax [,TItle(string) FIrstday(string) BGColor(string) TITLEFontfamily(string) TIMERFontfamily(string) SPANFontfamily(string) SAVEhtml(string)]

	if "`title'" == "" local title = "From the first day to the future"
	if "`firstday'" == "" local firstday = "2023-01-01 01:00:00"
	if "`bgcolor'" == "" local bgcolor = "#8dd3c7!important"
	if "`titlefontfamily'" == "" local titlefontfamily = "Source Han Serif"
	if "`timerfontfamily'" == "" local timerfontfamily = "Source Han Serif"
	if "`spanfontfamily'" == "" local spanfontfamily = "Helvetica,Arial,sans-serif"
	if "`savehtml'" == "" local savehtml = "lovingtimer.html"

	tempname myhandel 
	qui file open `myhandel' using `savehtml', w replace 
	file write `myhandel' "<!DOCTYPE HTML>" _n 
	file write `myhandel' "<html>" _n 
	file write `myhandel' "<head>" _n 
	file write `myhandel' "    <title>Loving timer</title>" _n 
	file write `myhandel' "    <script type='text/javascript' src='https://tidyfriday.cn/loving-timer/static/jquery.min.js'></script>" _n 
	file write `myhandel' "    <script type='text/javascript' src='https://tidyfriday.cn/loving-timer/static/TimeCircles.js'></script>" _n 
	file write `myhandel' "    <link rel='stylesheet' href='https://tidyfriday.cn/loving-timer/static/bootstrap.min.css'>" _n 
	file write `myhandel' "    <link rel='stylesheet' href='https://tidyfriday.cn/loving-timer/static/TimeCircles.css'>" _n 
	file write `myhandel' "    <style>" _n 
	file write `myhandel' "        body {" _n 
	file write `myhandel' "            -webkit-font-smoothing: antialiased;" _n 
	file write `myhandel' "            font-family: Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;" _n 
	file write `myhandel' "            background-color: `bgcolor';" _n 
	file write `myhandel' "        }" _n 
	file write `myhandel' "        .container {" _n 
	file write `myhandel' "            width: 800px;" _n 
	file write `myhandel' "            height: 340px;" _n 
	file write `myhandel' "            position: absolute;" _n 
	file write `myhandel' "            left: 50%;" _n 
	file write `myhandel' "            top: 50%;" _n 
	file write `myhandel' "            margin-left: -400px;" _n 
	file write `myhandel' "            margin-top: -170px;" _n 
	file write `myhandel' "        }" _n 
	file write `myhandel' "        h2 {" _n 
	file write `myhandel' "            text-align: center;" _n 
	file write `myhandel' "            font-family: `titlefontfamily';" _n 
	file write `myhandel' "        }" _n 
	file write `myhandel' "        h4 {" _n 
	file write `myhandel' "            text-align: center;" _n 
	file write `myhandel' "            font-family: `timerfontfamily';" _n 
	file write `myhandel' "        }" _n 
	file write `myhandel' "        span {" _n 
	file write `myhandel' "            text-align: center;" _n 
	file write `myhandel' "            font-family: `spanfontfamily';" _n 
	file write `myhandel' "        }" _n 
	file write `myhandel' "    </style>" _n 
	file write `myhandel' "</head>" _n 
	file write `myhandel' "<body>" _n 
	file write `myhandel' "    <div class='container'>" _n 
	file write `myhandel' "        <div class='content'>" _n 
	file write `myhandel' "            <h2>`title'</h2>" _n 
	file write `myhandel' "            <div id='DateCountdown' data-date='`firstday''></div>" _n 
	file write `myhandel' "        </div>" _n 
	file write `myhandel' "    </div>" _n 
	file write `myhandel' "    <script>$('#DateCountdown').TimeCircles();</script>" _n 
	file write `myhandel' "</body>" _n 
	file write `myhandel' "</html>" _n 
	file close `myhandel' 
	di "制作完成！使用浏览器打开工作目录下的 `savehtml' 文件即可！"
	di "文件位置：`c(pwd)'/`savehtml'"
end 

