/**
 * Created by HCN9FE on 12.02.2015.
 */


var antlr4 = require('js/antlr4/index');

console.log("==main.js" + antlr4);

var MyLexer = require('js/grammar/ComposerLexer');
var MyParser = require('js/grammar/ComposerParser');
var MyListener = require('js/grammar/ComposerListener');


//========================override default listener==============================
//===============================================================================

Listener = function() {
    MyListener.ComposerListener.call(this); // inherit default listener
    return this;
};
Listener.prototype = Object.create(Listener.prototype);
Listener.prototype.constructor = Listener;

Listener.prototype.enterConnect = function(ctx) {
    console.log("enter connect, should do the connection"
        + "our port is" + ctx.port
    );
};

Listener.prototype.enterDeclare = function(ctx) {
    console.log("enter declare, should create port map"
        + "our variable name is" + ctx.ID
    );
};

Listener.prototype.enterEveryRule = function(ctx){

};

//===========================our compile help function=============================

var compile = function(input){
    var chars = new antlr4.InputStream(input);
    var lexer = new MyLexer.ComposerLexer(chars);

    var tokens  = new antlr4.CommonTokenStream(lexer);
    var parser = new MyParser.ComposerParser(tokens);

    parser.buildParseTrees = true;

    var listener2 = new Listener();
    var listener1 = new MyListener.ComposerListener();

    console.log("listener 2 is" , listener2);

    var tree = parser.prog();
    console.log("enter every rule" + MyListener.enterConnect);
    antlr4.tree.ParseTreeWalker.DEFAULT.walk(listener1, tree);
};







var codeEl = document.getElementById("code");
var compileButton = document.getElementById("compile");
codeEl.value="" +
"block1 = Constant(2) \n"+
"block2 = Constant(\"1\")\n" +
"block3 = Adder()\n" +
"block1.output -> block3.input1\n" +
"block2.output -> block3.input2\n";


console.log("our element are" +  codeEl, compileButton);
compileButton.addEventListener('click', function (button) {
    compile(codeEl.value);
});
