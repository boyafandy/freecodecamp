const RomanNumerals = [
  {num: 'M', val: 1000},
  {num: 'CM', val: 900},
  {num: 'D', val: 500},
  {num: 'CD', val: 400},
  {num: 'C', val: 100},
  {num: 'XC', val: 90},
  {num: 'L', val: 50},
  {num: 'XL', val: 40},
  {num: 'X', val: 10},
  {num: 'IX', val: 9},
  {num: 'V', val: 5},
  {num: 'IV', val: 4},
  {num: 'I', val: 1},
]

function convertToRoman(num) {
 let result = ''
 for(let i = 0; i < RomanNumerals.length; i++){
   while(num >= RomanNumerals[i].val){
     result +=  RomanNumerals[i].num
     num -= RomanNumerals[i].val
   }
 }
 console.log(result)
 return result
}
