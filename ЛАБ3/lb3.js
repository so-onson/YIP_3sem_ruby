  function printElement (element, nesting=0) {

    let nestingString = '';
    if (nesting > 0) {
        nestingString = '\u00A0'.repeat(nesting * 2) + '|_';
    }

    let result = nestingString + element.tagName + '\n';

    for(const child of element.children) {
        result += printElement(child, nesting + 1);
    }

    return result;
}

function tree() {
    const string = printElement(document.body);
    console.log(string);
    let container = document.getElementById("demo");
    container.innerText = string;
}