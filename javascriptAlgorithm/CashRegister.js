function checkCashRegister(price, cash, cid) {

  const currency = [
    {unit: 'ONE HUNDRED', amount: 100},
    {unit: 'TWENTY', amount: 20},
    {unit: 'TEN', amount: 10},
    {unit: 'FIVE', amount: 5},
    {unit: 'ONE', amount: 1},
    {unit: 'QUARTER', amount: 0.25},
    {unit: 'DIME', amount: 0.1},
    {unit: 'NICKEL', amount: 0.05},
    {unit: 'PENNY', amount: 0.01},

  ]

  const result = {status: '', change: []}

  let totalChange = cash - price

  const totalCID = cid.reduce((total, curr) => total += curr[1], 0)

  if(totalCID == totalChange){
    result.status = 'CLOSED'
    result.change = [...cid]
    return result

  }

  if (totalCID < totalChange) {
    result.status = "INSUFFICIENT_FUNDS";
    result.change = []
    return result
  }

  //transform cid to object
  const cidObj = cid.reduce((cidObj, curr) => {
    cidObj[curr[0]] = curr[1]
    return cidObj
  }, {})


  currency.forEach(curr => {
    let change = 0
    while(cidObj[curr.unit] > 0 && totalChange >= curr.amount){
      totalChange -= curr.amount
      cidObj[curr.unit] -= curr.amount
      change += curr.amount

      totalChange = Math.round(totalChange * 100) / 100
    }

    if(change > 0) {
      result.change.push([curr.unit,change])
    }
  })

  if(totalChange > 0 || result.change.length < 1) {
    result.status = "INSUFFICIENT_FUNDS";
    result.change = []
    return result 
  }

  result.status = "OPEN";
  return result
}