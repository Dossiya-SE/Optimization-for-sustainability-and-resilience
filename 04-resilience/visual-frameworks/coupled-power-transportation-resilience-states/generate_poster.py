from pathlib import Path

W, H = 1050, 1485
STATES = [
    ("Sustain", "Maintain critical services (power & transportation)", "green"),
    ("Adapt", "Adjust operations and topology", "green"),
    ("Absorb", "Withstand disturbances", "green"),
    ("Recover", "Restore functionality", "greenamber"),
    ("Viable", "Operate within acceptable limits", "amber"),
    ("Critical Boundary", "At the edge of viability", "boundary"),
    ("Overload", "Exceed capacity limits", "red"),
    ("Degrade", "Performance deterioration", "red"),
    ("Cascade", "Propagate failures across systems", "darkred"),
    ("Collapse", "System failure and loss of critical services", "darkred"),
]

def build_svg():
    y0, dy, cx, rx, ry = 145, 118, 525, 248, 47
    o = []
    o.append(f'<svg xmlns="http://www.w3.org/2000/svg" width="297mm" height="420mm" viewBox="0 0 {W} {H}">')
    o.append('<defs>')
    o.append('<linearGradient id="gGreen"><stop stop-color="#009B2B"/><stop offset=".52" stop-color="#47D300"/><stop offset="1" stop-color="#058A2A"/></linearGradient>')
    o.append('<linearGradient id="gGA"><stop stop-color="#2FC900"/><stop offset=".65" stop-color="#B7E000"/><stop offset="1" stop-color="#F2B705"/></linearGradient>')
    o.append('<linearGradient id="gAmber"><stop stop-color="#FFD400"/><stop offset=".65" stop-color="#FF9B00"/><stop offset="1" stop-color="#F16A00"/></linearGradient>')
    o.append('<linearGradient id="gRed"><stop stop-color="#FF2C25"/><stop offset=".55" stop-color="#E10600"/><stop offset="1" stop-color="#B40000"/></linearGradient>')
    o.append('<linearGradient id="gDarkRed"><stop stop-color="#E10600"/><stop offset=".55" stop-color="#9C0000"/><stop offset="1" stop-color="#5C0000"/></linearGradient>')
    o.append('<style>.title{font:700 42px Arial,sans-serif;fill:#07153A}.sub{font:600 19px Arial,sans-serif;letter-spacing:8px;fill:#07153A}.state{font:700 35px Arial,sans-serif;fill:#07153A}.stateW{font:700 33px Arial,sans-serif;fill:white}.desc{font:500 18px Arial,sans-serif;fill:#07153A}.descW{font:500 17px Arial,sans-serif;fill:white}.side{font:700 31px Arial,sans-serif}.small{font:600 20px Arial,sans-serif}.rho{font:italic 700 43px Georgia,serif}</style>')
    o.append('</defs><rect width="1050" height="1485" fill="white"/>')
    o.append('<text x="525" y="50" text-anchor="middle" class="title">Coupled Power-Transportation Resilience States</text>')
    o.append('<line x1="90" y1="80" x2="180" y2="80" stroke="#07153A" stroke-width="2"/><line x1="870" y1="80" x2="960" y2="80" stroke="#07153A" stroke-width="2"/>')
    o.append('<text x="525" y="87" text-anchor="middle" class="sub">FROM RESILIENCE TO CASCADING FAILURE</text>')
    o.append('<line x1="170" y1="145" x2="170" y2="610" stroke="#058A2A" stroke-width="12"/><polygon points="170,365 145,390 170,415" fill="#058A2A"/>')
    o.append('<text x="45" y="330" class="side" fill="#058A2A">ASSETS</text><text x="55" y="380" class="small" fill="#058A2A">Build</text><text x="55" y="410" class="small" fill="#058A2A">Adapt</text><text x="55" y="440" class="small" fill="#058A2A">Recover</text><text x="55" y="470" class="small" fill="#058A2A">Thrive</text>')
    o.append('<line x1="170" y1="750" x2="170" y2="1260" stroke="#C40000" stroke-width="12"/><polygon points="170,990 145,1015 170,1040" fill="#C40000"/>')
    o.append('<text x="35" y="1000" class="side" fill="#B40000">LIABILITIES</text><text x="55" y="1050" class="small" fill="#B40000">Degrade</text><text x="55" y="1080" class="small" fill="#B40000">Lose</text><text x="55" y="1110" class="small" fill="#B40000">Cascade</text><text x="55" y="1140" class="small" fill="#B40000">Fail</text>')
    o.append('<text x="58" y="705" class="side" fill="#7A3200">Viability</text><text x="80" y="740" class="side" fill="#7A3200">Region</text>')
    gmap = {'green':'gGreen','greenamber':'gGA','amber':'gAmber','boundary':'gAmber','red':'gRed','darkred':'gDarkRed'}
    for i, (name, desc, kind) in enumerate(STATES):
        y = y0 + i*dy
        o.append(f'<ellipse cx="{cx}" cy="{y}" rx="{rx}" ry="{ry}" fill="white" stroke="url(#{gmap[kind]})" stroke-width="25"/>')
        if kind == 'boundary': o.append(f'<ellipse cx="{cx}" cy="{y}" rx="205" ry="34" fill="#8A4B00"/>')
        if kind == 'darkred': o.append(f'<ellipse cx="{cx}" cy="{y}" rx="205" ry="34" fill="#7C0A07"/>')
        c1, c2 = ('stateW','descW') if kind in ('boundary','darkred') else ('state','desc')
        o.append(f'<text x="{cx}" y="{y-2}" text-anchor="middle" class="{c1}">{name}</text>')
        o.append(f'<text x="{cx}" y="{y+26}" text-anchor="middle" class="{c2}">{desc}</text>')
    o.append('<path d="M760 112 h55 q20 0 20 20 v445 q0 20 -20 20 h-55" fill="none" stroke="#0B6B28" stroke-width="5"/>')
    o.append('<text x="860" y="285" class="side" fill="#0B6B28">Resilient-</text><text x="860" y="322" class="side" fill="#0B6B28">Sustainable</text><text x="860" y="359" class="side" fill="#0B6B28">Regime</text>')
    o.append('<text x="862" y="455" class="rho" fill="#086122">ρᵥ &gt; 0</text><text x="862" y="490" class="small" fill="#07153A">Inside viable region</text>')
    yb = y0 + 5*dy
    o.append(f'<line x1="765" y1="{yb}" x2="835" y2="{yb}" stroke="#8A4B00" stroke-width="4" stroke-dasharray="9 7"/><text x="855" y="{yb+15}" class="rho" fill="#8A4B00">ρᵥ = 0</text><text x="855" y="{yb+50}" class="small" fill="#07153A">On critical boundary</text>')
    o.append('<path d="M760 860 h55 q20 0 20 20 v410 q0 20 -20 20 h-55" fill="none" stroke="#C40000" stroke-width="5"/>')
    o.append('<text x="860" y="985" class="side" fill="#B40000">Cascade /</text><text x="860" y="1022" class="side" fill="#B40000">Failure</text><text x="860" y="1059" class="side" fill="#B40000">Regime</text><text x="862" y="1145" class="rho" fill="#B40000">ρᵥ &lt; 0</text><text x="862" y="1180" class="small" fill="#07153A">Outside viable region</text>')
    o.append('<rect x="30" y="1360" width="990" height="95" rx="15" fill="white" stroke="#07153A" stroke-width="3"/><line x1="350" y1="1375" x2="350" y2="1440" stroke="#07153A"/><line x1="700" y1="1375" x2="700" y2="1440" stroke="#07153A"/>')
    o.append('<text x="190" y="1405" text-anchor="middle" class="rho" fill="#0B6B28">ρᵥ &gt; 0:</text><text x="190" y="1438" text-anchor="middle" class="small" fill="#07153A">inside viable region</text><text x="525" y="1405" text-anchor="middle" class="rho" fill="#8A4B00">ρᵥ = 0:</text><text x="525" y="1438" text-anchor="middle" class="small" fill="#07153A">on critical boundary</text><text x="860" y="1405" text-anchor="middle" class="rho" fill="#B40000">ρᵥ &lt; 0:</text><text x="860" y="1438" text-anchor="middle" class="small" fill="#07153A">outside viable region</text>')
    o.append('</svg>')
    return ''.join(o)

if __name__ == '__main__':
    target = Path(__file__).with_name('poster-a3.svg')
    target.write_text(build_svg(), encoding='utf-8')
    print(target)
