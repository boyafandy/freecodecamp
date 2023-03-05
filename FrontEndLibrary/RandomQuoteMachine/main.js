async function fetchQuotes() {
  //does not handle errors
  const response = await fetch("https://gist.githubusercontent.com/camperbot/5a022b72e96c4c9585c32bf6a75f62d9/raw/e3c6895ce42069f0ee7e991229064f167fe8ccdc/quotes.json")
  const json = await response.json()
  return json.quotes
}

const colors = [
  '#16a085',
  '#27ae60',
  '#2c3e50',
  '#f39c12',
  '#e74c3c',
  '#9b59b6',
  '#FB6964',
  '#342224',
  '#472E32',
  '#BDBB99',
  '#77B1A9',
  '#73A857'
];

function getQuote(quotes){
  const randQuoteIdx = Math.floor(Math.random() * quotes.length);
  const randColorIdx = Math.floor(Math.random() * colors.length);
  const quote = quotes[randQuoteIdx]

  const quoteText = quote.quote;
  const quoteAuthor = quote.author

  $('#tweet-quote').attr(
    'href',
    'https://twitter.com/intent/tweet?hashtags=quotes&text=' +
      encodeURIComponent('"' + quoteText + '" - ' + quoteAuthor)
  );

  $('#author').text(quoteAuthor);

  $('#text').text(quoteText)

  $("#tweet-quote, #new-quote").animate({backgroundColor: colors[randColorIdx]}, 500)


  $('body').animate(
    {
      backgroundColor: colors[randColorIdx],
      color: colors[randColorIdx]
    },
    1000
  );

}

$(document).ready(() => {
  fetchQuotes().then(quotes => {
    getQuote(quotes)
    $('#new-quote').on('click', () => {
      getQuote(quotes)
    });
  })
})