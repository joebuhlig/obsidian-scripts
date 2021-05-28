async function my_function() {
  let response = await fetch("https://beta.ourmanna.com/api/v1/get/?format=json");
  let json = await response.json();
  let reference = json.verse.details.reference;
  let wikilink = reference.replace(":", "#");
  let new_content = `> ![[${wikilink}|${reference}]]\n> &mdash; <cite>[[${wikilink}|${reference}]]</cite>`

  return new_content;
}
module.exports = my_function;