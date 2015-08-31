var fs = require('fs'),
    xml2js = require('xml2js'),
    Q = require('q'),
    parser = new xml2js.Parser(),
    vrtJSON = null,
    keyString = '',
    keys = [],
    oldVRTkeysValues = '';

init()
.then(function(results) {
  return Q.fcall(parseResults, results[0], results[1]);
})
.then(function(txt) {
  fs.writeFile('old_vrt_rgb_values.txt', txt, function(err) {
    if (err) return console.error(err);
  });
});


function readOldVRT() {
  // read in the old VRT XML color values & convert to JSON
  return Q.nfcall(fs.readFile, 'old_lc_rgb_values.txt', 'utf-8')
  .then(function(text) {
    return Q.nfcall(parser.parseString, text)
  })
  .then(function(json){
    return json;
  })
  .fail(function(err) {
    console.error(err);
    return err;
  });
}


function readOldKey() {
  // read in the key for national map landcover color values
  return Q.nfcall(fs.readFile, 'old_key.txt', 'utf-8')
  .then(function(text) {    
    return parseKey(text);
  })
  .fail(function(err){
    console.error(err);
    return err;
  });
}

function parseKey(txt) {
  var txtArr = txt.split('\n'),
      tmpkeys = [];

  txtArr.forEach(function(d,i) {
    d = d.replace(/\d/g,'');
    d = d.replace(/\s+$/,'');
    tmpkeys.push(d);
  });

  console.log(tmpkeys);

  return tmpkeys;
}

function parseResults(keys, json) {
  var tmp = [];
  
  json.ColorTable.Entry.forEach(function(d,i,arr){        
    var r = d['$'].c1,
        g = d['$'].c2,
        b = d['$'].c3;

    var rgbString = keys[i] +  ' = r: ' + r + ' g: ' + g + ' b: ' + b;

    if (i !== arr.length -1 ) {
      rgbString += '\n';
    }

    tmp.push(rgbString);
  });

  tmp = tmp.join('');

  return tmp;
}

function init() {
  return Q.all([
    readOldKey(),
    readOldVRT()
  ]);
}