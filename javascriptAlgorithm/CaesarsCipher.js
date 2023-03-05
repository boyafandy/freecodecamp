function rot13(str) {
  let result = ''
  for(let letter of str){
    if(/\W/.test(letter)){
      result+=letter
      continue
    }
    let newLetterCode = letter.charCodeAt() + 13
    if(newLetterCode > 90){
      result+=String.fromCharCode(64 + (newLetterCode % 90))
    } else {
      result+=String.fromCharCode(newLetterCode)
    }
  }
  console.log(result)
  return result
}