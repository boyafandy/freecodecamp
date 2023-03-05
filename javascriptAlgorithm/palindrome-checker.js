function palindrome(str) {
  //remove all non-alphanumeric characters
  str = str.toLowerCase().match(/[a-z0-9]/g)

  //using 2 pointer method:
  //1. get first and last index
  //2. check the value, if not equal then return false 
  //3. if equal then update first+=1 and last-=1
  //4. repeat 2-4

  let first = 0;
  let last = str.length -1;

  while(first < last){
    if(str[first] !== str[last]){
      return false
    }
    first++
    last--
  }

  return true;
}

palindrome("eye");