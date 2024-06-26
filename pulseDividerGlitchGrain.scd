///Pulse Divider
Server.default.makeGui;
////
(
{
	arg lfoS=2,speed=64,maxLen=0.1,lenMod=1,freq=50,dist=10;
	var src1, src2, src3;
	a=LFNoise0; // Try different UGens
	b=Array.geom(8,0.25,0.75); // Amplitude
	c=Array.geom(8,maxLen+a.ar(lfoS,lenMod).abs,0.5); // Decay length
	d=Array.geom(8,freq,2); // Frequency
	src1 = Mix.fill(4,{arg i;
		SinOscFB.ar(d[i],2.0.rand,
			Decay.ar(PulseDivider.ar(Impulse.ar(a.ar(lfoS!2,speed).round(speed-1)+1),a.ar(0.25*lfoS!2,speed*2).round(speed-1)),
				c[i],dist*a.ar(2!2))
	).tanh*b[i]});
	src2 = Mix.fill(4,{arg i;
		Blip.ar(d[i],25.rand,
			Decay.ar(PulseDivider.ar(Impulse.ar(a.ar(lfoS!2,speed*2).round(speed-1)+1),a.ar(0.25*lfoS!2,speed*2).round(speed*2-1)),
				c[i],dist*a.ar(2!2))
	).tanh*b[i]});
	src3 = Mix.fill(4,{arg i;
		Crackle.ar(rrand(1.5,1.9),
			Decay.ar(PulseDivider.ar(Impulse.ar(a.ar(lfoS!2,speed*3).round(speed-1)+1),a.ar(0.25*lfoS!2,speed*2).round(speed*3-1)),
				c[i],dist*a.ar(2!2))
	).tanh*b[i]});
	MoogFF.ar((src1+(src2*0.05)+(src3*0.01)*XLine.ar(dist,dist*8,120,1,0,2)).fold(-0.9,0.9),10000,2)
}.play;
)

///SYNC 2
(
{
	arg lfoS=2,speed=64,maxLen=0.1,lenMod=1,freq=50,dist=10;
	var src1, src2, src3;
	a=LFNoise0; // Try different UGens
	b=Array.geom(8,0.25,0.75); // Amplitude
	c=Array.geom(8,maxLen+a.ar(lfoS,lenMod).abs,0.5); // Decay length
	d=Array.geom(8,freq,2); // Frequency
	src1 = Mix.fill(4,{arg i;
		SinOscFB.ar(d[i],2.0.rand,
			Decay.ar(PulseDivider.ar(Impulse.ar(a.ar(lfoS!2,speed).round(speed-1)+1),a.ar(0.25*lfoS!2,speed*2).round(speed-1)),
				c[i],dist*a.ar(2!2))
	).tanh*b[i]});
	src2 = Mix.fill(4,{arg i;
		Blip.ar(d[i],25.rand,
			Decay.ar(PulseDivider.ar(Impulse.ar(a.ar(lfoS!2,speed*2).round(speed-1)+1),a.ar(0.25*lfoS!2,speed*2).round(speed*2-1)),
				c[i],dist*a.ar(2!2))
	).tanh*b[i]});
	src3 = Mix.fill(4,{arg i;
		Crackle.ar(rrand(1.5,1.9),
			Decay.ar(PulseDivider.ar(Impulse.ar(a.ar(lfoS!2,speed*3).round(speed-1)+1),a.ar(0.25*lfoS!2,speed*2).round(speed*3-1)),
				c[i],dist*a.ar(2!2))
	).tanh*b[i]});
	MoogFF.ar((src1+(src2*0.05)+(src3*0.01)*XLine.ar(dist,dist*8,120,1,0,2)).fold(-0.9,0.9),10000,2)
}.scope;

{
	arg lfoS=2,speed=100,maxLen=0.1,lenMod=1,freq=50,dist=10;
	var src1, src2, src3;
	a=LFNoise1; // Try different UGens
	b=Array.geom(8,0.25,0.75); // Amplitude
	c=Array.geom(8,maxLen+a.ar(lfoS,lenMod).abs,0.5); // Decay length
	d=Array.geom(8,freq,2); // Frequency
	src1 = Mix.fill(4,{arg i;
		SinOscFB.ar(d[i],2.0.rand,
			Decay.ar(PulseDivider.ar(Impulse.ar(a.ar(lfoS!2,speed).round(speed-1)+1),a.ar(0.25*lfoS!2,speed*2).round(speed-1)),
				c[i],dist*a.ar(2!2))
	).tanh*b[i]});
	src2 = Mix.fill(4,{arg i;
		Blip.ar(d[i],25.rand,
			Decay.ar(PulseDivider.ar(Impulse.ar(a.ar(lfoS!2,speed*2).round(speed-1)+1),a.ar(0.25*lfoS!2,speed*2).round(speed*2-1)),
				c[i],dist*a.ar(2!2))
	).tanh*b[i]});
	src3 = Mix.fill(4,{arg i;
		Crackle.ar(rrand(1.5,1.9),
			Decay.ar(PulseDivider.ar(Impulse.ar(a.ar(lfoS!2,speed*3).round(speed-1)+1),a.ar(0.25*lfoS!2,speed*2).round(speed*3-1)),
				c[i],dist*a.ar(2!2))
	).tanh*b[i]});
	MoogFF.ar((src1+(src2*0.05)+(src3*0.01)*XLine.ar(dist,dist*8,120,1,0,2)).fold(-0.9,0.9),10000,2)
}.play;
)

////PLAY ON A NDEF
(// Define the Ndef
Ndef(\sound, {
    arg lfoS=2, speed=64, maxLen=0.1, lenMod=1, freq=50, dist=10;
    var src1, src2, src3;
    var a = LFNoise0, b, c, d;

    b = Array.geom(8, 0.25, 0.75); // Amplitude
    c = Array.geom(8, maxLen + a.ar(lfoS, lenMod).abs, 0.5); // Decay length
    d = Array.geom(8, freq, 2); // Frequency

    src1 = Mix.fill(4, { arg i;
        SinOscFB.ar(d[i], 2.0.rand,
            Decay.ar(PulseDivider.ar(Impulse.ar(a.ar(lfoS!2, speed).round(speed-1) + 1), a.ar(0.25 * lfoS!2, speed*2).round(speed-1)),
                c[i], dist * a.ar(2!2))
        ).tanh * b[i]
    });

    src2 = Mix.fill(4, { arg i;
        Blip.ar(d[i], 25.rand,
            Decay.ar(PulseDivider.ar(Impulse.ar(a.ar(lfoS!2, speed*2).round(speed-1) + 1), a.ar(0.25 * lfoS!2, speed*2).round(speed*2-1)),
                c[i], dist * a.ar(2!2))
        ).tanh * b[i]
    });

    src3 = Mix.fill(4, { arg i;
        Crackle.ar(rrand(1.5, 1.9),
            Decay.ar(PulseDivider.ar(Impulse.ar(a.ar(lfoS!2, speed*3).round(speed-1) + 1), a.ar(0.25 * lfoS!2, speed*2).round(speed*3-1)),
                c[i], dist * a.ar(2!2))
        ).tanh * b[i]
    });

    MoogFF.ar((src1 + (src2 * 0.05) + (src3 * 0.01) * XLine.ar(dist, dist*8, 120, 1, 0, 2)).fold(-0.9, 0.9), 10000, 2)
}).play.scope;
)

// Change parameters dynamically
Ndef(\sound).set(\lfoS, 2);
Ndef(\sound).set(\speed, 50);
Ndef(\sound).set(\maxLen, 0.1);
Ndef(\sound).set(\lenMod, 2);
Ndef(\sound).set(\freq, 500);
Ndef(\sound).set(\dist, 10);
// Stop the Ndef without removing it
Ndef(\sound).stop;
// Play the Ndef again
Ndef(\sound).play;
// Free the Ndef from the server
Ndef(\sound).clear;








///fork and variations on the code from https://github.com/RumushMycelialCords/SuperCollider/tree/master/Functions
