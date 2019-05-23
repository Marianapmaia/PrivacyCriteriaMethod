//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/


//PRIVATE PERSONAL INFORMATION
var int_pip = 0;

function show_pip(){
    if (int_pip < 4){
        int_pip = int_pip + 1
        var pip = document.getElementById('pip'+int_pip.toString())
        pip.style.display = "block";
    }
    this.btn_pip();
}

function update_pip(plist, pdesc){
    var piplist = document.getElementById('pip' + int_pip.toString() + 'list')
    piplist.value = plist;
    
    var pipdesc = document.getElementById('pip' + int_pip.toString() + 'desc')
    pipdesc.value = pdesc;
    
    show_pip()
}


function remove_pip(){
    if (int_pip > 0){
        var pip = document.getElementById('pip'+int_pip.toString())
        pip.style.display = "none";
        
        var piplist = document.getElementById('pip' + int_pip.toString() + 'list')
        piplist.value = "";
        
        var pipdesc = document.getElementById('pip' + int_pip.toString() + 'desc')
        pipdesc.value = "";
        
        int_pip = int_pip - 1
    }
    this.btn_pip();
}

function btn_pip(){
    if (int_pip <= 0){
        document.getElementById('btn_remove_pip').disabled = true
    }else{
        document.getElementById('btn_remove_pip').disabled = false
    }
    
    if (int_pip >= 4){
        document.getElementById('btn_show_pip').disabled = true
    }else{
        document.getElementById('btn_show_pip').disabled = false
    }
}


//PRIVATE PUBLIC INFORMATION
var int_pipu = 0;

function show_pipu(){
    if (int_pipu < 4){
        int_pipu = int_pipu + 1
        var pipu = document.getElementById('pipu'+int_pipu.toString())
        pipu.style.display = "block";
    }
    this.btn_pipu();
}

function update_pipu(plist,pdesc){
    var pipulist = document.getElementById('pipu' + int_pipu.toString() + 'list')
    pipulist.value = plist;
    
    var pipudesc = document.getElementById('pipu' + int_pipu.toString() + 'desc')
    pipudesc.value = pdesc;
    show_pipu()
}

function remove_pipu(){
    if (int_pipu > 0){
        var pipu = document.getElementById('pipu'+int_pipu.toString())
        pipu.style.display = "none";
        
        var pipulist = document.getElementById('pipu' + int_pipu.toString() + 'list')
        pipulist.value = ""
        
        var pipudesc = document.getElementById('pipu' + int_pipu.toString() + 'desc')
        pipudesc.value = ""
        
        int_pipu = int_pipu - 1
    }
    this.btn_pipu();
}

function btn_pipu(){
    if (int_pipu <= 0){
        document.getElementById('btn_remove_pipu').disabled = true
    }else{
        document.getElementById('btn_remove_pipu').disabled = false
    }
    
    if (int_pipu >= 4){
        document.getElementById('btn_show_pipu').disabled = true
    }else{
        document.getElementById('btn_show_pipu').disabled = false
    }
}

//PRIVATE SEMI-PUBLIC INFORMATION
var int_pis = 0;

function show_pis(){
    if (int_pis < 4){
        int_pis = int_pis + 1
        var pis = document.getElementById('pis'+int_pis.toString())
        pis.style.display = "block";
    }
    this.btn_pis();
}

function update_pis(plist,pdesc){
    var pislist = document.getElementById('pis' + int_pis.toString() + 'list')
    pislist.value = plist;
    
    var pisdesc = document.getElementById('pis' + int_pis.toString() + 'desc')
    pisdesc.value = pdesc;
    show_pis()
}

function remove_pis(){
    if (int_pis > 0){
        var pis = document.getElementById('pis'+int_pis.toString())
        pis.style.display = "none";
        
        var pislist = document.getElementById('pis' + int_pis.toString() + 'list')
        pislist.value = ""
        
        var pisdesc = document.getElementById('pis' + int_pis.toString() + 'desc')
        pisdesc.value = ""
        
        int_pis = int_pis - 1
    }
    this.btn_pis();
}

function btn_pis(){
    if (int_pis <= 0){
        document.getElementById('btn_remove_pis').disabled = true
    }else{
        document.getElementById('btn_remove_pis').disabled = false
    }
    
    if (int_pis >= 4){
        document.getElementById('btn_show_pis').disabled = true
    }else{
        document.getElementById('btn_show_pis').disabled = false
    }
}

//PRIVATE RISKS
var int_risk = 0;

function show_risk(){
    if (int_risk < 9){
        int_risk = int_risk + 1
        var risk = document.getElementById('risk'+int_risk.toString())
        risk.style.display = "block";
    }
    this.btn_risk();
}

function update_risk(vul,thread,harm){
    var risk_vul = document.getElementById('risk'+int_risk.toString() + 'vul')
    risk_vul.value = vul
    
    var risk_thread = document.getElementById('risk'+int_risk.toString() + 'thread')
    risk_thread.value = thread
    
    var risk_harm = document.getElementById('risk'+int_risk.toString() + 'harm')
    risk_harm.value = harm
    
    show_risk()
}

function remove_risk(){
    if (int_risk > 0){
        
        var risk = document.getElementById('risk'+int_risk.toString())
        risk.style.display = "none";
        
        var risk_vul = document.getElementById('risk'+int_risk.toString() + 'vul')
        risk_vul.value = ""
        
        var risk_thread = document.getElementById('risk'+int_risk.toString() + 'thread')
        risk_thread.value = ""
        
        var risk_harm = document.getElementById('risk'+int_risk.toString() + 'harm')
        risk_harm.value = ""
        
        int_risk = int_risk - 1
    }
    this.btn_risk();
}

function btn_risk(){
    if (int_risk <= 0){
        document.getElementById('btn_remove_risk').disabled = true
    }else{
        document.getElementById('btn_remove_risk').disabled = false
    }
    
    if (int_risk >= 9){
        document.getElementById('btn_show_risk').disabled = true
    }else{
        document.getElementById('btn_show_risk').disabled = false
    }
}

//PRIVACY MEC
var int_mec = 0;

function show_mec(){
    if (int_mec < 9){
        int_mec = int_mec + 1
        var mec = document.getElementById('mec'+int_mec.toString())
        mec.style.display = "block";
    }
    this.btn_mec();
}

function update_mec(mec){
    var mecinput = document.getElementById('mec'+int_mec.toString() + 'input')
    mecinput.value = mec
    show_mec()
}

function remove_mec(){
    if (int_mec > 0){
        var mec = document.getElementById('mec'+int_mec.toString())
        mec.style.display = "none";
        
        var mecinput = document.getElementById('mec'+int_mec.toString() + 'input')
        mecinput.value = ""
        
        
        int_mec = int_mec - 1
    }
    this.btn_mec();
}

function btn_mec(){
    if (int_mec <= 0){
        document.getElementById('btn_remove_mec').disabled = true
    }else{
        document.getElementById('btn_remove_mec').disabled = false
    }
    
    if (int_mec >= 9){
        document.getElementById('btn_show_mec').disabled = true
    }else{
        document.getElementById('btn_show_mec').disabled = false
    }
}