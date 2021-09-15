Global $cfgPath
Global $data
Global $regEx
Global $outData
Global $sign = [["A", "38"],  ["B", "3B"],  ["C", "3A"],  ["D", "3D"],  ["E", "3C"],  ["F", "3F"],  ["G", "3E"],  ["H", "31"],  ["I", "30"],  ["J", "33"],  ["K", "32"],  ["L", "35"],  ["M", "34"],  ["N", "37"],  ["O", "36"],  ["P", "29"],  ["Q", "28"],  ["R", "2B"],  ["S", "2A"],  ["T", "2D"],  ["U", "2C"],  ["V", "2F"],  ["W", "2E"],  ["X", "20"],  ["Y", "21"],  ["Z", "23"],  ["a", "18"],  ["b", "1B"],  ["c", "1A"],  ["d", "1D"],  ["e", "1C"],  ["f", "1F"],  ["g", "1E"],  ["h", "11"],  ["i", "10"],  ["j", "13"],  ["k", "12"],  ["l", "15"],  ["m", "14"],  ["n", "17"],  ["o", "16"],  ["p", "09"],  ["q", "08"],  ["r", "0B"],  ["s", "0A"],  ["t", "0D"],  ["u", "0C"],  ["v", "0F"],  ["w", "0E"],  ["x", "01"],  ["y", "00"],  ["z", "03"],  ["0", "49"],  ["1", "48"],  ["2", "4B"],  ["3", "4A"],  ["4", "4D"],  ["5", "4C"],  ["6", "4F"],  ["7", "4E"],  ["8", "41"],  ["9", "40"],  ["=", "44"],  [".", "57"]]

Func StringDecode($string)
	Local $str
	Local $result
	For $i = 0 To StringLen($string) - 1 Step 2
		$str = StringMid($string,$i + 1,2)
		For $j = 0 to UBound($sign) - 1 Step 1
			$result &= ($str = $sign[$j][1]) ? $sign[$j][0] : ""
		Next
	Next
	Return $result
EndFunc

Func StringEncode($string)
	Local $str
	Local $result
	For $i = 0 To StringLen($string) - 1 Step 1
		$str = StringMid($string,$i + 1,1)
		For $j = 0 to UBound($sign) - 1 Step 1
			$result &= ($str == $sign[$j][0]) ? $sign[$j][1] : ""
		Next
	Next
	Return $result
EndFunc

Func isCode($string)
	If StringRegExp($string,'[A-Z_][0-9]') Then Return True
	Return False
EndFunc
