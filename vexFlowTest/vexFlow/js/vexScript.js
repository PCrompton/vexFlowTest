function drawStaffWithPitch(pitch) {
    VF = Vex.Flow;
        
    var div = document.getElementById("note")
    var renderer = new VF.Renderer(div, VF.Renderer.Backends.CANVAS);
    renderer.resize(200, 140);
    var context = renderer.getContext();
    context.setFont("Arial", 10, "").setBackgroundFillStyle("#eed");
    
    var stave = new VF.Stave(25, 0, 150);
    stave.addClef("treble");
    stave.setContext(context).draw();
    
    var note = new VF.StaveNote({keys: [pitch], duration: "w" })
    var notes = [note];
    var voice = new VF.Voice({num_beats: 4,  beat_value: 4});
    voice.addTickables(notes);
    var formatter = new VF.Formatter().joinVoices([voice]).format([voice], 400);
    
    voice.draw(context, stave);
}
