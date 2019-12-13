.model small
.386
.stack 256
.data
    input db 127 dup(0)
    handlein dw 1
    output db 127 dup(0)
    lenout dw 0
    handleout dw 1
    disasmdescr db "dziugas ramonas, i kursas, ii grupe, disasm$"
    badinput db "nepavyko atidaryti ivesties failo$"
    badoutput db "nepavyko sukurti/atidaryti isvesties failo$"
    inputdata db 400h dup('p')
	inbufsize dw 10h
    looops dw 1
    iter dw 0
	totalbytecounter dw 100h
	func dw f0, f1, f2, f3, f4, "00", f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18
	funcprint dw "00", nxt1, nxt2, nxt3, nxt4, nxt5, nxt6, nxt7, nxt8, nxt9, nxt10, nxt11, nxt12, nxt13
	justread db 0
	wadd7 db 2, 3, 4, 0, "add   ", 2, ",", 4, 0
	wor7 db 2, 3, 4, 0, "or    ", 2, ",", 4, 0
	wadc7 db 2, 3, 4, 0, "adc   ", 2, ",", 4, 0
	wsbb7 db 2, 3, 4, 0, "sbb   ", 2, ",", 4, 0
	wand7 db 2, 3, 4, 0, "and   ", 2, ",", 4, 0
	wsub7 db 2, 3, 4, 0, "sub   ", 2, ",", 4, 0
	wxor7 db 2, 3, 4, 0, "xor   ", 2, ",", 4, 0
	wcmp7 db 2, 3, 4, 0, "cmp   ", 2, ",", 4, 0
	wkomcodes7 dw wadd7, wor7, wadc7, wsbb7, wand7, wsub7, wxor7, wcmp7
	wrol130 db 2, 0, "rol   ", 2, ",1", 0
	wror130 db 2, 0, "ror   ", 2, ",1", 0
	wrcl130 db 2, 0, "rcl   ", 2, ",1", 0
	wrcr130 db 2, 0, "rcr   ", 2, ",1", 0
	wshl130 db 2, 0, "shl   ", 2, ",1", 0
	wshr130 db 2, 0, "shr   ", 2, ",1", 0
	wnan130 db 0, "neatpazinta", 0
	wsar130 db 2, 0, "sar   ", 2, ",1", 0
	wkomcodes130 dw wrol130, wror130, wrcl130, wrcr130, wshl130, wshr130, wnan130, wsar130
	wrol131 db 2, 0, "rol   ", 2, ",cl", 0
	wror131 db 2, 0, "ror   ", 2, ",cl", 0
	wrcl131 db 2, 0, "rcl   ", 2, ",cl", 0
	wrcr131 db 2, 0, "rcr   ", 2, ",cl", 0
	wshl131 db 2, 0, "shl   ", 2, ",cl", 0
	wshr131 db 2, 0, "shr   ", 2, ",cl", 0
	wnan131 db 0, "neatpazinta", 0
	wsar131 db 2, 0, "sar   ", 2, ",cl", 0
	wkomcodes131 dw wrol131, wror131, wrcl131, wrcr131, wshl131, wshr131, wnan131, wsar131
	wtest17 db 2, 3, 4, 0, "test  ", 2, ",", 4, 0
	wnan17 db 0, "neatpazinta", 0
	wnot17 db 2, 0, "not   ", 2, 0
	wneg17 db 2, 0, "neg   ", 2, 0
	wmul17 db 2, 0, "mul   ", 2, 0
	wimul17 db 2, 0, "imul  ", 2, 0
	wdiv17 db 2, 0, "div   ", 2, 0
	widiv17 db 2, 0, "idiv  ", 2, 0
	wkomcodes17 dw wtest17, wnan17, wnot17, wneg17, wmul17, wimul17, wdiv17, widiv17
	winc180 db 2, 0, "inc   ", 2, 0
	wdec180 db 2, 0, "dec   ", 2, 0
	wcallvid180 db 2, 0, "call  ", 2, 0
	wcallis180 db 2, 0, "call  ", 2, 0
	wjmpvid180 db 2, 0, "jmp   ", 2, 0
	wjmpis180 db 2, 0, "jmp   ", 2, 0
	wpush180 db 2, 0, "push  ", 2, 0
	wnan180 db 0, "neatpazinta", 0
	wkomcodes180 dw winc180, wdec180, wcallvid180, wcallis180, wjmpvid180, wjmpis180, wpush180, wnan180
	winc181 db 2, 0, "inc   ", 2, 0
	wdec181 db 2, 0, "dec   ", 2, 0
	wcallvid181 db 2, 0, "call  ", 2, 0
	wcallis181 db 2, 0, "call  ", 2, 0
	wjmpvid181 db 2, 0, "jmp   ", 2, 0
	wjmpis181 db 2, 0, "jmp   ", 2, 0
	wpush181 db 2, 0, "push  ", 2, 0
	wnan181 db 0, "neatpazinta", 0
	wkomcodes181 dw winc181, wdec181, wcallvid181, wcallis181, wjmpvid181, wjmpis181, wpush181, wnan181
	currd db 0
	currs db 0
	currv db 0
	currw db 0
	currsr db 0
	currmod db 0
	currreg db 0
	currrm db 0
	currposlinkisb db 0
	currposlinkisw db 0
	currajb db 0
	curravb db 0
	currbojb db 0
	currbovb db 0
	currpjb db 0
	currpvb db 0
	currsrjb db 0
	currsrvb db 0
	currnumeris db 0
	currportas db 0
	clearableparams dw currd, currs, currv, currw, currsr, currmod, currreg, currrm, currposlinkisb, currposlinkisw, currajb, curravb, currbojb, currbovb, currpjb, currpvb, currsrjb, currsrvb, currnumeris, currportas, 0,0, 0, 0
	regal db "al", 0
	regcl db "cl", 0
	regdl db "dl", 0
	regbl db "bl", 0
	regah db "ah", 0
	regch db "ch", 0
	regdh db "dh", 0
	regbh db "bh", 0
	regw0 dw regal, regcl, regdl, regbl, regah, regch, regdh, regbh
	regax db "ax", 0
	regcx db "cx", 0
	regdx db "dx", 0
	regbx db "bx", 0
	regsp db "sp", 0
	regbp db "bp", 0
	regsi db "si", 0
	regdi db "di", 0
	regw1 dw regax, regcx, regdx, regbx, regsp, regbp, regsi, regdi
	rm000 db "bx+si", 0
	rm001 db "bx+di", 0
	rm010 db "bp+si", 0
	rm011 db "bp+di", 0
	rm100 db "si", 0
	rm101 db "di", 0
	rm110 db "bp", 0
	rm111 db "bx", 0
	rmarr dw rm000, rm001, rm010, rm011, rm100, rm101, rm110, rm111
	segreg00 db "es", 0
	segreg01 db "cs", 0
	segreg10 db "ss", 0
	segreg11 db "ds", 0
	segregarr dw segreg00, segreg01, segreg10, segreg11
	addregreg00 db 0, 0, 0, 0, 0, 0, 	1, 2, 0, "add    ", 2, ",", 1, 0
	addregreg01 db 0, 1, 0, 0, 0, 0, 	1, 2, 0, "add    ", 2, ",", 1, 0
	addregreg10 db 1, 0, 0, 0, 0, 0, 	1, 2, 0, "add    ", 1, ",", 2, 0
	addregreg11 db 1, 1, 0, 0, 0, 0,	1, 2, 0, "add    ", 1, ",", 2, 0
	addakumop0 db 0, 0, 0, 0, 0, 0, 	3, 4, 0, "add    ", 3, ",", 4, 0
	addakumop1 db 0, 1, 0, 0, 0, 0, 	3, 4, 0, "add    ", 3, ",", 4, 0
	pushsr00 db 0, 0, 0, 0, 0, 0,		0, "push   ", 5, 0
	popsr00 db 0, 0, 0, 0, 0, 0,		0, "pop    ", 5, 0
	orregreg00 db 0, 0, 0, 0, 0, 0,	 	1, 2, 0, "or     ", 2, ",", 1, 0
	orregreg01 db 0, 1, 0, 0, 0, 0,	 	1, 2, 0, "or     ", 2, ",", 1, 0
	orregreg10 db 1, 0, 0, 0, 0, 0,	 	1, 2, 0, "or     ", 1, ",", 2, 0
	orregreg11 db 1, 1, 0, 0, 0, 0,	 	1, 2, 0, "or     ", 1, ",", 2, 0
	orakumop0 db 0, 0, 0, 0, 0, 0,	 	3, 4, 0, "or     ", 3, ",", 4, 0
	orakumop1 db 0, 1, 0, 0, 0, 0,	 	3, 4, 0, "or     ", 3, ",", 4, 0
	pushsr01 db 0, 0, 0, 0, 1, 0,		0, "push   ", 5, 0
	popsr01 db 0, 0, 0, 0, 1, 0,		0, "pop    ", 5, 0
	adcregreg00 db 0, 0, 0, 0, 0, 0,	1, 2, 0, "adc    ", 2, ",", 1, 0
	adcregreg01 db 0, 1, 0, 0, 0, 0,	1, 2, 0, "adc    ", 2, ",", 1, 0
	adcregreg10 db 1, 0, 0, 0, 0, 0,	1, 2, 0, "adc    ", 1, ",", 2, 0
	adcregreg11 db 1, 1, 0, 0, 0, 0,	1, 2, 0, "adc    ", 1, ",", 2, 0
	adcakumop0 db 0, 0, 0, 0, 0, 0,	 	3, 4, 0, "adc    ", 3, ",", 4, 0
	adcakumop1 db 0, 1, 0, 0, 0, 0,	 	3, 4, 0, "adc    ", 3, ",", 4, 0
	pushsr10 db 0, 0, 0, 0, 2, 0,		0, "push   ", 5, 0
	popsr10 db 0, 0, 0, 0, 2, 0,		0, "pop    ", 5, 0
	sbbregreg00 db 0, 0, 0, 0, 0, 0,	1, 2, 0, "sbb    ", 2, ",", 1, 0
	sbbregreg01 db 0, 1, 0, 0, 0, 0,	1, 2, 0, "sbb    ", 2, ",", 1, 0
	sbbregreg10 db 1, 0, 0, 0, 0, 0,	1, 2, 0, "sbb    ", 1, ",", 2, 0
	sbbregreg11 db 1, 1, 0, 0, 0, 0,	1, 2, 0, "sbb    ", 1, ",", 2, 0
	sbbakumop0 db 0, 0, 0, 0, 0, 0,		3, 4, 0, "sbb    ", 3, ",", 4, 0
	sbbakumop1 db 0, 1, 0, 0, 0, 0,	 	3, 4, 0, "sbb    ", 3, ",", 4, 0
	pushsr11 db 0, 0, 0, 0, 3, 0,		0, "push   ", 5, 0
	popsr11 db 0, 0, 0, 0, 3, 0,		0, "pop    ", 5, 0
	andregreg00 db 0, 0, 0, 0, 0, 0,	1, 2, 0, "and    ", 2, ",", 1, 0
	andregreg01 db 0, 1, 0, 0, 0, 0,	1, 2, 0, "and    ", 2, ",", 1, 0
	andregreg10 db 1, 0, 0, 0, 0, 0,	1, 2, 0, "and    ", 1, ",", 2, 0
	andregreg11 db 1, 1, 0, 0, 0, 0,	1, 2, 0, "and    ", 1, ",", 2, 0
	andakumop0 db 0, 0, 0, 0, 0, 0,		3, 4, 0, "and    ", 3, ",", 4, 0
	andakumop1 db 0, 1, 0, 0, 0, 0,	 	3, 4, 0, "and    ", 3, ",", 4, 0
	seg00reg db 0, 0, 0, 0, 0, 0, 		0, "es:",	0
	odaa db 0, 0, 0, 0, 0, 0,			0, "daa", 	0
	subregreg00 db 0, 0, 0, 0, 0, 0,	1, 2, 0, "sub    ", 2, ",", 1, 0
	subregreg01 db 0, 1, 0, 0, 0, 0,	1, 2, 0, "sub    ", 2, ",", 1, 0
	subregreg10 db 1, 0, 0, 0, 0, 0,	1, 2, 0, "sub    ", 1, ",", 2, 0
	subregreg11 db 1, 1, 0, 0, 0, 0,	1, 2, 0, "sub    ", 1, ",", 2, 0
	subakumop0 db 0, 0, 0, 0, 0, 0,		3, 4, 0, "sub    ", 3, ",", 4, 0
	subakumop1 db 0, 1, 0, 0, 0, 0,	 	3, 4, 0, "sub    ", 3, ",", 4, 0
	seg01reg db 0, 0, 0, 0, 1, 0, 		0, "cs:",	0
	odas db 0, 0, 0, 0, 0, 0,			0, "das", 	0
	xorregreg00 db 0, 0, 0, 0, 0, 0,	1, 2, 0, "xor    ", 2, ",", 1, 0
	xorregreg01 db 0, 1, 0, 0, 0, 0,	1, 2, 0, "xor    ", 2, ",", 1, 0
	xorregreg10 db 1, 0, 0, 0, 0, 0,	1, 2, 0, "xor    ", 1, ",", 2, 0
	xorregreg11 db 1, 1, 0, 0, 0, 0,	1, 2, 0, "xor    ", 1, ",", 2, 0
	xorakumop0 db 0, 0, 0, 0, 0, 0,		3, 4, 0, "xor    ", 3, ",", 4, 0
	xorakumop1 db 0, 1, 0, 0, 0, 0,	 	3, 4, 0, "xor    ", 3, ",", 4, 0
	seg10reg db 0, 0, 0, 0, 2, 0, 		0, "ss:",	0
	oaaa db 0, 0, 0, 0, 0, 0,			0, "aaa", 	0
	cmpregreg00 db 0, 0, 0, 0, 0, 0,	1, 2, 0, "cmp    ", 2, ",", 1, 0
	cmpregreg01 db 0, 1, 0, 0, 0, 0,	1, 2, 0, "cmp    ", 2, ",", 1, 0
	cmpregreg10 db 1, 0, 0, 0, 0, 0,	1, 2, 0, "cmp    ", 1, ",", 2, 0
	cmpregreg11 db 1, 1, 0, 0, 0, 0,	1, 2, 0, "cmp    ", 1, ",", 2, 0
	cmpakumop0 db 0, 0, 0, 0, 0, 0,		3, 4, 0, "cmp    ", 3, ",", 4, 0
	cmpakumop1 db 0, 1, 0, 0, 0, 0,	 	3, 4, 0, "cmp    ", 3, ",", 4, 0
	seg11reg db 0, 0, 0, 0, 3, 0, 		0, "ds:",	0
	oaas db 0, 0, 0, 0, 0, 0,			0, "aas", 	0
	increg000 db 0, 1, 0, 0, 0, 0, 		0, "inc    ", 1, 0
	increg001 db 0, 1, 0, 0, 0, 1, 		0, "inc    ", 1, 0
	increg010 db 0, 1, 0, 0, 0, 2, 		0, "inc    ", 1, 0
	increg011 db 0, 1, 0, 0, 0, 3, 		0, "inc    ", 1, 0
	increg100 db 0, 1, 0, 0, 0, 4, 		0, "inc    ", 1, 0
	increg101 db 0, 1, 0, 0, 0, 5, 		0, "inc    ", 1, 0
	increg110 db 0, 1, 0, 0, 0, 6, 		0, "inc    ", 1, 0
	increg111 db 0, 1, 0, 0, 0, 7, 		0, "inc    ", 1, 0
	decreg000 db 0, 1, 0, 0, 0, 0, 		0, "dec    ", 1, 0
	decreg001 db 0, 1, 0, 0, 0, 1, 		0, "dec    ", 1, 0
	decreg010 db 0, 1, 0, 0, 0, 2, 		0, "dec    ", 1, 0
	decreg011 db 0, 1, 0, 0, 0, 3, 		0, "dec    ", 1, 0
	decreg100 db 0, 1, 0, 0, 0, 4, 		0, "dec    ", 1, 0
	decreg101 db 0, 1, 0, 0, 0, 5, 		0, "dec    ", 1, 0
	decreg110 db 0, 1, 0, 0, 0, 6, 		0, "dec    ", 1, 0
	decreg111 db 0, 1, 0, 0, 0, 7, 		0, "dec    ", 1, 0
	pushreg000 db 0, 1, 0, 0, 0, 0, 	0, "push   ", 1, 0
	pushreg001 db 0, 1, 0, 0, 0, 1, 	0, "push   ", 1, 0
	pushreg010 db 0, 1, 0, 0, 0, 2, 	0, "push   ", 1, 0
	pushreg011 db 0, 1, 0, 0, 0, 3, 	0, "push   ", 1, 0
	pushreg100 db 0, 1, 0, 0, 0, 4, 	0, "push   ", 1, 0
	pushreg101 db 0, 1, 0, 0, 0, 5, 	0, "push   ", 1, 0
	pushreg110 db 0, 1, 0, 0, 0, 6, 	0, "push   ", 1, 0
	pushreg111 db 0, 1, 0, 0, 0, 7, 	0, "push   ", 1, 0
	popreg000 db 0, 1, 0, 0, 0, 0, 		0, "pop    ", 1, 0
	popreg001 db 0, 1, 0, 0, 0, 1, 		0, "pop    ", 1, 0
	popreg010 db 0, 1, 0, 0, 0, 2, 		0, "pop    ", 1, 0
	popreg011 db 0, 1, 0, 0, 0, 3, 		0, "pop    ", 1, 0
	popreg100 db 0, 1, 0, 0, 0, 4, 		0, "pop    ", 1, 0
	popreg101 db 0, 1, 0, 0, 0, 5, 		0, "pop    ", 1, 0
	popreg110 db 0, 1, 0, 0, 0, 6, 		0, "pop    ", 1, 0
	popreg111 db 0, 1, 0, 0, 0, 7, 		0, "pop    ", 1, 0
	ojo db 0, 0, 0, 0, 0, 0,			6,0, "jo     ", 6, 0
	ojno db 0, 0, 0, 0, 0, 0,			6,0, "jno    ", 6, 0
	ojnae db 0, 0, 0, 0, 0, 0,			6,0, "jnae   ", 6, 0
	ojae db 0, 0, 0, 0, 0, 0,			6,0, "jae    ", 6, 0
	oje db 0, 0, 0, 0, 0, 0,			6,0, "je     ", 6, 0
	ojne db 0, 0, 0, 0, 0, 0,			6,0, "jne    ", 6, 0
	ojbe db 0, 0, 0, 0, 0, 0,			6,0, "jbe    ", 6, 0
	oja db 0, 0, 0, 0, 0, 0,			6,0, "ja     ", 6, 0
	ojs db 0, 0, 0, 0, 0, 0,			6,0, "js     ", 6, 0
	ojns db 0, 0, 0, 0, 0, 0,			6,0, "jns    ", 6, 0
	ojp db 0, 0, 0, 0, 0, 0,			6,0, "jp     ", 6, 0
	ojnp db 0, 0, 0, 0, 0, 0,			6,0, "jnp    ", 6, 0
	ojl db 0, 0, 0, 0, 0, 0,			6,0, "jl     ", 6, 0
	ojge db 0, 0, 0, 0, 0, 0,			6,0, "jge    ", 6, 0
	ojle db 0, 0, 0, 0, 0, 0,			6,0, "jle    ", 6, 0
	ojg db 0, 0, 0, 0, 0, 0,			6,0, "jg     ", 6, 0
	byte2regop00 db 0, 0, 0, 0, 0, 0, 	7
	byte2regop01 db 0, 1, 0, 0, 0, 0, 	7
	byte2regop10 db 0, 0, 1, 0, 0, 0, 	7
	byte2regop11 db 0, 1, 1, 0, 0, 0, 	7
	testregreg0 db 0, 0, 0, 0, 0, 0,	1, 2, 0, "test   ", 1, ",", 2, 0
	testregreg1 db 0, 1, 0, 0, 0, 0,	1, 2, 0, "test   ", 1, ",", 2, 0
	xchgregreg0 db 0, 0, 0, 0, 0, 0,	1, 2, 0, "xchg   ", 1, ",", 2, 0
	xchgregreg1 db 0, 1, 0, 0, 0, 0,	1, 2, 0, "xchg   ", 1, ",", 2, 0
	movregreg00 db 0, 0, 0, 0, 0, 0,	1, 2, 0, "mov    ", 2, ",", 1, 0
	movregreg01 db 0, 1, 0, 0, 0, 0,	1, 2, 0, "mov    ", 2, ",", 1, 0
	movregreg10 db 1, 0, 0, 0, 0, 0,	1, 2, 0, "mov    ", 1, ",", 2, 0
	movregreg11 db 1, 1, 0, 0, 0, 0,	1, 2, 0, "mov    ", 1, ",", 2, 0
	movsegregreg0 db 0, 0, 0, 0, 0, 0,	8, 2, 0, "mov    ", 2, ",", 5, 0
	learegatm db 0, 0, 0, 0, 0, 0, 		1, 2, 0, "lea    ", 1, ",", 2, 0
	movsegregreg1 db 1, 0, 0, 0, 0, 0,	8, 2, 0, "mov    ", 5, ",", 2, 0
	popregatm db 0, 0, 0, 0, 0, 0, 		9, 2, 0, "pop    ", 2, 0
	onop db 0, 0, 0, 0, 0, 0,			0, "nop    ", 0
	xchgregax000 db 0, 0, 0, 0, 0, 0,	0, "xchg   ", 1, ",ax", 0
	xchgregax001 db 0, 0, 0, 0, 0, 1,	0, "xchg   ", 1, ",ax", 0
	xchgregax010 db 0, 0, 0, 0, 0, 2,	0, "xchg   ", 1, ",ax", 0
	xchgregax011 db 0, 0, 0, 0, 0, 3,	0, "xchg   ", 1, ",ax", 0
	xchgregax100 db 0, 0, 0, 0, 0, 4,	0, "xchg   ", 1, ",ax", 0
	xchgregax101 db 0, 0, 0, 0, 0, 5,	0, "xchg   ", 1, ",ax", 0
	xchgregax110 db 0, 0, 0, 0, 0, 6,	0, "xchg   ", 1, ",ax", 0
	xchgregax111 db 0, 0, 0, 0, 0, 7,	0, "xchg   ", 1, ",ax", 0
	ocbw db 0, 0, 0, 0, 0, 0, 			0, "cbw    ", 0
	ocwd db 0, 0, 0, 0, 0, 0, 			0, "cwd    ", 0
	callzyisties db 0, 0, 0, 0, 0, 0,	10, 11, 0, "call   ", 9, 0
	owait db 0, 0, 0, 0, 0, 0,			0, "wait   ", 0
	opushf db 0, 0, 0, 0, 0, 0,			0, "pushf  ", 0
	opopf db 0, 0, 0, 0, 0, 0,			0, "popf   ", 0
	osahf db 0, 0, 0, 0, 0, 0,			0, "sahf   ", 0
	olahf db 0, 0, 0, 0, 0, 0,			0, "lahf   ", 0
	movakumatm0 db 0, 0, 0, 0, 0, 0,	10, 0, "mov    ", 3, ",", 8, 0
	movakumatm1 db 0, 1, 0, 0, 0, 0,	10, 0, "mov    ", 3, ",", 8, 0
	movatmakum0 db 0, 0, 0, 0, 0, 0,	10, 0, "mov    ", 8, ",", 3, 0
	movatmakum1 db 0, 1, 0, 0, 0, 0,	10, 0, "mov    ", 8, ",", 3, 0
	movsb0 db 0, 0, 0, 0, 0, 0,			0, "movsb  ", 0
	movsw1 db 0, 1, 0, 0, 0, 0,			0, "movsw  ", 0
	cmpsb0 db 0, 0, 0, 0, 0, 0,			0, "cmpsb  ", 0
	cmpsw1 db 0, 1, 0, 0, 0, 0,			0, "cmpsw  ", 0
	testakumop0 db 0, 0, 0, 0, 0, 0,	3, 4, 0, "test   ", 3, ",", 4, 0
	testakumop1 db 0, 1, 0, 0, 0, 0,	3, 4, 0, "test   ", 3, ",", 4, 0
	stosb0 db 0, 0, 0, 0, 0, 0, 		0, "stosb  ", 0
	stosw1 db 0, 1, 0, 0, 0, 0, 		0, "stosw  ", 0
	lodsb0 db 0, 0, 0, 0, 0, 0, 		0, "lodsb  ", 0
	lodsw1 db 0, 1, 0, 0, 0, 0, 		0, "lodsw  ", 0
	scasb0 db 0, 0, 0, 0, 0, 0, 		0, "scasb  ", 0
	scasw1 db 0, 1, 0, 0, 0, 0, 		0, "scasw  ", 0
	movregop0000 db 0, 0, 0, 0, 0, 0,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop0001 db 0, 0, 0, 0, 0, 1,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop0010 db 0, 0, 0, 0, 0, 2,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop0011 db 0, 0, 0, 0, 0, 3,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop0100 db 0, 0, 0, 0, 0, 4,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop0101 db 0, 0, 0, 0, 0, 5,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop0110 db 0, 0, 0, 0, 0, 6,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop0111 db 0, 0, 0, 0, 0, 7,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop1000 db 0, 1, 0, 0, 0, 0,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop1001 db 0, 1, 0, 0, 0, 1,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop1010 db 0, 1, 0, 0, 0, 2,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop1011 db 0, 1, 0, 0, 0, 3,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop1100 db 0, 1, 0, 0, 0, 4,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop1101 db 0, 1, 0, 0, 0, 5,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop1110 db 0, 1, 0, 0, 0, 6,	3, 4, 0, "mov    ", 1, ",", 4, 0
	movregop1111 db 0, 1, 0, 0, 0, 7,	3, 4, 0, "mov    ", 1, ",", 4, 0
	retnop db 0, 1, 0, 0, 0, 0,			3, 4, 0, "retn   ", 4, 0
	oret db 0, 0, 0, 0, 0, 0,			0, "ret    ", 0
	lesregatm db 0, 0, 0, 0, 0, 0,		1, 2, 0, "les    ", 1, ",", 2, 0
	ldsregatm db 0, 0, 0, 0, 0, 0,		1, 2, 0, "lds    ", 1, ",", 2, 0	
	movregop0 db 0, 0, 0, 0, 0, 0,		9, 2, 3, 4, 0, "mov    ", 2, ",", 4, 0
	movregop1 db 0, 1, 0, 0, 0, 0,		9, 2, 3, 4, 0, "mov    ", 2, ",", 4, 0
	retfop db 0, 1, 0, 0, 0, 0,			3, 4, 0, "retf   ", 4, 0
	oretf db 0, 0, 0, 0, 0, 0, 			0, "retf   ", 0
	oint3 db 0, 0, 0, 0, 0, 0, 			0, "int3   ", 0
	ointnum db 0, 0, 0, 0, 0, 0,		12, 0, "int    ", 11, 0
	ointo db 0, 0, 0, 0, 0, 0, 			0, "into   ", 0
	oiret db 0, 0, 0, 0, 0, 0, 			0, "iret   ", 0
	byte2regatm00 db 0, 0, 0, 0, 0, 0, 	13
	byte2regatm01 db 0, 1, 0, 0, 0, 0, 	13
	byte2regatm10 db 0, 0, 0, 1, 0, 0, 	13
	byte2regatm11 db 0, 1, 0, 1, 0, 0, 	13
	oaam db 0, 0, 0, 0, 0, 0, 			14, 0, "aam    ", 0
	oaad db 0, 0, 0, 0, 0, 0, 			14, 0, "aad    ", 0
	oxlat db 0, 0, 0, 0, 0, 0, 			0, "xlat   ", 0
	escregxxx db 0, 0, 0, 0, 0, 0, 		9, 2, 0, "esc    ", 2, 0
	loopnezy db 0, 0, 0, 0, 0, 0, 		6, 0, "loopne  ", 6, 0
	loopezy db 0, 0, 0, 0, 0, 0, 		6, 0, "loope  ", 6, 0
	loopzy db 0, 0, 0, 0, 0, 0, 		6, 0, "loop   ", 6, 0 
	jcxzzy db 0, 0, 0, 0, 0, 0, 		6, 0, "jcxz   ", 6, 0
	inakumport0 db 0, 0, 0, 0, 0, 0, 	15, 0, "in     ", 3, ",", 12, 0
	inakumport1 db 0, 1, 0, 0, 0, 0, 	15, 0, "in     ", 3, ",", 12, 0
	outakumport0 db 0, 0, 0, 0, 0, 0, 	15, 0, "out    ", 3, ",", 12, 0
	outakumport1 db 0, 1, 0, 0, 0, 0, 	15, 0, "out    ", 3, ",", 12, 0
	callzyvidties db 0, 0, 0, 0, 0, 0, 	16, 0, "call   ", 13, 0
	jmpzyvidties db 0, 0, 0, 0, 0, 0, 	16, 0, "jmp    ", 13, 0
	jmpzyisorties db 0, 0, 0, 0, 0, 0, 	10, 11, 0, "jmp    ", 9, 0
	jmpzyvidart db 0, 0, 0, 0, 0, 0, 	6, 0, "jmp    ", 6, 0
	inakumdx0 db 0, 0, 0, 0, 0, 0, 		0, "in     dx,", 3, 0 
	inakumdx1 db 0, 1, 0, 0, 0, 0, 		0, "in     dx,", 3, 0
	outakumdx0 db 0, 0, 0, 0, 0, 0, 	0, "out    dx,", 3, 0
	outakumdx1 db 0, 1, 0, 0, 0, 0, 	0, "out    dx,", 3, 0
	olock db 0, 0, 0, 0, 0, 0, 			0, "lock   ", 0
	orepnz db 0, 0, 0, 0, 0, 0, 		0, "repnz  ", 0
	orep db 0, 0, 0, 0, 0, 0, 			0, "rep    ", 0
	ohlt db 0, 0, 0, 0, 0, 0, 			0, "hlt    ", 0
	ocmc db 0, 0, 0, 0, 0, 0, 			0, "cmc    ", 0
	byte2regop0 db 0, 0, 0, 0, 0, 0, 	17
	byte2regop1 db 0, 1, 0, 0, 0, 0, 	17
	oclc db 0, 0, 0, 0, 0, 0, 			0, "clc    ", 0
	ostc db 0, 0, 0, 0, 0, 0, 			0, "stc    ", 0
	ocli db 0, 0, 0, 0, 0, 0, 			0, "cli    ", 0
	osti db 0, 0, 0, 0, 0, 0, 			0, "sti    ", 0
	ocld db 0, 0, 0, 0, 0, 0, 			0, "cld    ", 0
	ostd db 0, 0, 0, 0, 0, 0, 			0, "std    ", 0
	byte2incdeccall0 db 0, 0, 0, 0, 0, 0, 18
	byte2incdeccall1 db 0, 1, 0, 0, 0, 0, 18
	nezin db 0, 0, 0, 0, 0, 0, 			0, "neatpazinta", 0
komcodes dw addregreg00,addregreg01,addregreg10,addregreg11,addakumop0,addakumop1,pushsr00,popsr00,orregreg00,orregreg01,orregreg10,orregreg11,orakumop0,orakumop1,pushsr01,popsr01,adcregreg00,adcregreg01,adcregreg10,adcregreg11,adcakumop0,adcakumop1,pushsr10,popsr10,sbbregreg00,sbbregreg01,sbbregreg10,sbbregreg11,sbbakumop0,sbbakumop1,pushsr11,popsr11,andregreg00,andregreg01,andregreg10,andregreg11,andakumop0,andakumop1,seg00reg,odaa,subregreg00,subregreg01,subregreg10,subregreg11,subakumop0,subakumop1,seg01reg,odas,xorregreg00,xorregreg01,xorregreg10,xorregreg11,xorakumop0,xorakumop1,seg10reg,oaaa,cmpregreg00,cmpregreg01,cmpregreg10,cmpregreg11,cmpakumop0,cmpakumop1,seg11reg,oaas,increg000,increg001,increg010,increg011,increg100,increg101,increg110,increg111,decreg000,decreg001,decreg010
dw decreg011,decreg100,decreg101,decreg110,decreg111,pushreg000,pushreg001,pushreg010,pushreg011,pushreg100,pushreg101,pushreg110,pushreg111,popreg000,popreg001,popreg010,popreg011,popreg100,popreg101,popreg110,popreg111,nezin,nezin,nezin,nezin,nezin,nezin,nezin,nezin,nezin,nezin,nezin,nezin,nezin,nezin,nezin,nezin,ojo,ojno,ojnae,ojae,oje,ojne,ojbe,oja,ojs,ojns,ojp,ojnp,ojl,ojge,ojle,ojg,byte2regop00,byte2regop01,byte2regop10,byte2regop11,testregreg0,testregreg1,xchgregreg0,xchgregreg1,movregreg00,movregreg01,movregreg10,movregreg11,movsegregreg0,learegatm,movsegregreg1,popregatm,xchgregax000,xchgregax001,xchgregax010,xchgregax011,xchgregax100,xchgregax101,xchgregax110,xchgregax111,ocbw,ocwd,callzyisties,owait,opushf,opopf,osahf,olahf,movakumatm0,movakumatm1,movatmakum0,movatmakum1,movsb0,movsw1,cmpsb0,cmpsw1,testakumop0,testakumop1,stosb0,stosw1,lodsb0,lodsw1
dw scasb0,scasw1,movregop0000,movregop0001,movregop0010,movregop0011,movregop0100,movregop0101,movregop0110,movregop0111,movregop1000,movregop1001,movregop1010,movregop1011,movregop1100,movregop1101,movregop1110,movregop1111,nezin,nezin,retnop,oret,lesregatm,ldsregatm,movregop0,movregop1,nezin,nezin,retfop,oretf,oint3,ointnum,ointo,oiret,byte2regatm00,byte2regatm01,byte2regatm10,byte2regatm11,oaam,oaad,nezin,oxlat,escregxxx,escregxxx,escregxxx,escregxxx,escregxxx,escregxxx,escregxxx,escregxxx,loopnezy,loopezy,loopzy,jcxzzy,inakumport0,inakumport1,outakumport0,outakumport1,callzyvidties,jmpzyvidties,jmpzyisorties,jmpzyvidart,inakumdx0,inakumdx1,outakumdx0,outakumdx1,olock,nezin,orepnz,orep,ohlt,ocmc,byte2regop0,byte2regop1,oclc,ostc,ocli,osti,ocld,ostd,byte2incdeccall0,byte2incdeccall1

.code
strt:
mov ax,@data
mov ds,ax
mov bx, 82h
mov cl,es:[80h]
cmp cl, 3
jl printinfo
mov di, offset input
call readcomlineword
cmp di, offset input
je printinfo
mov di, offset output
call readcomlineword
cmp di, offset output
je printinfo
mov dx, offset input
mov ax, 3d00h
int 21h
jnc goodin
mov dx, offset badinput
mov ah, 09h
int 21h
mov ah, 4ch
int 21h 
goodin:
mov handlein, ax
mov dx, offset output
mov ah, 3ch
mov cx, 0
int 21h
jnc goodout
mov dx, offset badoutput
mov ah, 09h
int 21h
mov ah, 4ch
int 21h 
goodout:
mov handleout, ax
call getnewbuf
loop2: 
	mov bx, totalbytecounter
	mov lenout, 0
	mov al, bh
	call writenumber
	mov al, bl
	call writenumber
	mov bx, iter
	mov al, ':'
	call writechar
	mov al, ' '
	call writechar
	mov al, [inputdata+bx]
	xor ah, ah
	call savebyte
	add ax, ax
	inc iter
	inc totalbytecounter
	inc bx
	cmp bx, looops
	jne contloop2
	call getnewbuf
	contloop2:
	call run
	mov al, 13
	call writechar
	call printoutoutput
	mov cx, looops
	cmp cx, iter
	jne loop2
jmp endentireprogram
printoutoutput proc
	mov bx, handleout
	mov cx, lenout
	mov dx, offset output
	mov ah, 40h
	int 21h
	ret
endp printoutoutput
run proc
	xor dx, dx
	clearallparams:
	mov bx, dx
	mov bx, [clearableparams+bx]
	cmp bx, 0
	je allparamsclear
	mov byte ptr [bx], 0
	add dx, 2
	jmp clearallparams
	allparamsclear:
	mov bx, ax
	mov bx, [komcodes+bx]
	mov ah, [bx]
	mov currd, ah
	mov ah, [bx+1]
	mov currw, ah
	mov ah, [bx+2]
	mov currs, ah
	mov ah, [bx+3]
	mov currv, ah
	mov ah, [bx+4]
	mov currsr, ah
	mov ah, [bx+5]
	mov currreg, ah
	add bx, 5
	reppeat:
	inc bx
	mov dl, [bx]
	cmp dl, 0
	jne n0
	call f0
	ret
	n0:
		push bx 
		xor dh, dh
		add dx, dx
		mov bx, dx
		mov dx, [func+bx]
		pop bx
		jmp dx
endp run
writetext proc
	writetextloop:
	cmp byte ptr[bx], 0
	jne contwritetext
	ret
	contwritetext:
	mov cl, [bx]
	mov di, lenout
	mov [output+di], cl
	mov [output+di+1], 10
	inc lenout
	inc bx
	jmp writetextloop
endp writetext
writechar proc
	push bx
	cmp justread, 0
	je contwrite
	mov justread, 0
	loopwritechar:
	mov bx, lenout
	mov [output+bx], ' '
	inc lenout
	cmp lenout, 22
	jl loopwritechar
	contwrite:
	mov bx, lenout
	mov [output+bx], al
	mov [output+bx+1], 10
	inc lenout
	pop bx
ret
endp writechar
writenumchar proc
	cmp al, 10
	add al, '0'
	cmp al, '9'
	jle wrnum
	add al, 39
	wrnum:
	call writechar
	ret
endp writenumchar
writenumber proc
	xor ah, ah
	mov cl, 10h
	div cl
	call writenumchar
	mov al, ah
	call writenumchar
	ret
endp writenumber
f0 proc
	printwhile:
	inc bx
	mov al, [bx]
	cmp al, 0
	je endprint
	cmp al, ' '
	jl runproc
	call writechar
	jmp printwhile
	runproc:
		push bx 
		mov dl, al
		xor dh, dh
		add dx, dx
		mov bx, dx
		mov dx, [funcprint+bx]
		pop bx
		jmp dx
		nxt1:
		cmp currw, 0
		je wwww0
		push bx
		mov bl, currreg
		xor bh, bh
		add bx, bx
		mov bx, [regw1+bx]
		call writetext
		pop bx
		jmp printwhile
		wwww0:
		push bx
		mov bl, currreg
		xor bh, bh
		add bx, bx
		mov bx, [regw0+bx]
		call writetext
		pop bx
		jmp printwhile
		nxt2:
		cmp currmod, 3
		je printrmregg
		mov al, '['
		call writechar
		cmp currmod, 0
		jne ignorecheck46
		cmp currrm, 6
		jne ignorecheck46
		jmp justignoredcheck354
		ignorecheck46:
		push bx
		mov bl, currrm
		xor bh, bh
		add bx, bx
		mov bx, [rmarr+bx]
		call writetext
		pop bx
		cmp currmod, 0
		je endthirdaction
		mov al, '+'
		call writechar
		justignoredcheck354:
		cmp currmod, 1
		je skipaction259
		mov al, currposlinkisw
		call writenumber
		skipaction259:
		mov al, currposlinkisb
		call writenumber
		endthirdaction:
		mov al, ']'
		call writechar
		jmp printwhile
		printrmregg:
		push bx
		mov bl, currrm
		xor bh,bh
		mov currreg, bl
		mov al, 1
		pop bx
		jmp runproc
		nxt3:
		cmp [currw], 0
		jne printakumw1
		mov al, 'a'
		call writechar
		mov al, 'l'
		call writechar
		jmp printwhile
		printakumw1:
		mov al, 'a'
		call writechar
		mov al, 'x'
		call writechar
		jmp printwhile
		nxt4:
		cmp currw, 0
		je skipwrite
		mov al, currbovb
		call writenumber
		skipwrite:
		mov al, currbojb
		call writenumber
		jmp printwhile
		nxt5:
		push bx
		mov bl, currsr
		xor ah, ah
		add bx, bx
		mov bx, [segregarr+bx]
		call writetext
		pop bx
		jmp printwhile
		nxt6:
		mov al, currposlinkisw
		call writenumber
		mov al, currposlinkisb
		call writenumber
		jmp printwhile
		nxt7:
		jmp printwhile
		nxt8:
		mov al, curravb
		call writenumber
		mov al, currajb
		call writenumber		
		jmp printwhile
		nxt9:
		mov al, curravb
		call writenumber
		mov al, currajb
		call writenumber
		mov al, ':'
		call writechar
		mov al, currsrvb
		call writenumber
		mov al, currsrjb
		call writenumber	
		jmp printwhile
		nxt10:
		jmp printwhile
		nxt11:
		mov al, currnumeris
		call writenumber
		jmp printwhile
		nxt12:
		mov al, currportas
		call writenumber
		jmp printwhile
		nxt13:
		mov al, currpvb
		call writenumber
		mov al, currpjb
		call writenumber	
		jmp printwhile
	endprint:
	ret
endp f0
f1:
	call likef1
	jmp reppeat
likef1 proc
	call readbyte
	mov cl, 01000000b
	div cl
	mov currmod, al
	mov al, ah
	xor ah, ah
	mov cl, 1000b
	div cl
	mov currreg, al
	mov currrm, ah
	ret
endp likef1
f2:
	cmp currmod, 3
	je finishupf2
	cmp currmod, 0
	jne procf2486
	cmp currrm, 6
	jne finishupf2
	procf2486:
	call readbyte
	mov currposlinkisb, al
	cmp currmod, 1
	je finishupf2
	call readbyte
	mov currposlinkisw, al
	finishupf2:
	jmp reppeat
f3:
	call readbyte
	mov currbojb, al
	jmp reppeat
f4:
	cmp currw, 0
	je reppeat
	cmp currs, 1
	je nearendprocf4
	call readbyte
	mov currbovb,al
	jmp reppeat
	nearendprocf4:
	mov al, currbojb
	xor ah, ah
	mov cl, 10000000b
	div cl
	cmp al, 0
	je reppeat
	mov currbovb, 11111111b	
	jmp reppeat
f6:
	call readbyte
	mov cx, totalbytecounter
	add cx, ax
	mov currposlinkisb, cl
	mov currposlinkisw, ch
	jmp reppeat
f7:
	call likef1
	mov bl, currreg
	xor bh, bh
	add bx, bx
	mov bx, [wkomcodes7+bx]
	dec bx
	jmp reppeat
f8:
	call likef1
	mov cl, currreg
	mov currsr, cl
	jmp reppeat
f9:
	jmp f1
f10:
	call readbyte
	mov currajb, al
	call readbyte
	mov curravb, al
	jmp reppeat
f11:
	call readbyte
	mov currsrjb, al
	call readbyte
	mov currsrvb, al
	jmp reppeat
f12:
	call readbyte
	mov currnumeris, al
	jmp reppeat
f13:
	call likef1
	mov bl, currreg
	xor bh, bh
	add bx, bx
	cmp currv, 0
	jne wkom1
	mov bx, [wkomcodes130+bx]
	dec bx
	jmp reppeat
	wkom1:
	mov bx, [wkomcodes131+bx]
	dec bx
	jmp reppeat
f14:
	call readbyte
	jmp reppeat
f15:
	call readbyte
	mov currportas, al
	jmp reppeat
f16:
	call readbyte
	mov currpjb, al
	call readbyte
	mov currpvb, al
	jmp reppeat
f17:
	call likef1
	mov bl, currreg
	xor bh, bh
	add bx, bx
	mov bx, [wkomcodes17+bx]
	dec bx
	jmp reppeat
f18:
	call likef1
	mov bl, currreg
	xor bh, bh
	add bx, bx
	cmp currw, 0
	jne wkomm1
	mov bx, [wkomcodes180+bx]
	dec bx
	jmp reppeat
	wkomm1:
	mov bx, [wkomcodes181+bx]
	dec bx
	jmp reppeat
readbyte proc
	push bx
	mov bx, iter
	mov al, [inputdata+bx]
	xor ah, ah
	inc iter
	inc totalbytecounter
	inc bx
	cmp bx, looops
	jne contread
	call getnewbuf
	contread:
	pop bx
	call savebyte
	ret
endp readbyte
getnewbuf proc
	push bx 
	push ax
	mov bx, handlein
	mov cx, inbufsize
	mov dx, offset inputdata
	mov ah, 3fh
	int 21h
	mov iter, 0
	mov looops, ax
	pop ax 
	pop bx
	ret
endp getnewbuf
savebyte proc
	mov justread, 0
	push ax
	call writenumber
	pop ax
	mov justread, 1
	ret
endp savebyte
readcomlineword proc
	mov cl, es:[bx]
	inc bx
	cmp cl, ' '
	jle endreadcomlineword
	mov [di], cl
	inc di
	jmp readcomlineword
	endreadcomlineword:
	ret
endp readcomlineword
printinfo:
    mov dx, offset disasmdescr  
    mov ah, 09h
    int 21h
 endentireprogram:
 mov ah, 4ch
    int 21h
end strt
