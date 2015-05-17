template = '
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg width="{{ total_width }}" height="32px" viewBox="0 0 {{ total_width }} 32" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns">
    <!-- Generator: Sketch 3.3.1 (12002) - http://www.bohemiancoding.com/sketch -->
    <title>marker_with_title</title>
    <desc>Created with Sketch.</desc>
    <defs></defs>
    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" sketch:type="MSPage">
        <g id="marker_with_title" sketch:type="MSLayerGroup">
          <g id="title_trail" display="{{ display }}">
            <g id="trail" transform="translate({{ x_trail }}, 0.000000)" sketch:type="MSShapeGroup">
                <circle id="oval-3" fill="#00407E" cx="16" cy="16" r="16"></circle>
                <circle id="oval-2" fill="#FFFFFF" cx="16" cy="16" r="13"></circle>
                <circle id="over-1" fill="#00407E" cx="16" cy="16" r="11"></circle>
            </g>
            <g id="title" transform="translate(16.000000, 0.000000)">
                <rect id="Rectangle-1" fill="#00407E" sketch:type="MSShapeGroup" x="0" y="0" width="{{ width_title }}" height="32"></rect>
                <rect id="Rectangle-2" fill="#FFFFFF" sketch:type="MSShapeGroup" x="1" y="3" width="{{ width_title }}" height="26"></rect>
                <rect id="Rectangle-3" fill="#00407E" sketch:type="MSShapeGroup" x="1" y="5" width="{{ width_title }}" height="22"></rect>
                <text id="イコー" sketch:type="MSTextLayer" font-family="Hiragino Kaku Gothic ProN" font-size="16" font-weight="526" fill="#FFFFFF">
                    <tspan x="18.36" y="22">{{ title }}</tspan>
                </text>
            </g>
          </g>
            <g id="marker" sketch:type="MSShapeGroup">
                <circle id="oval-3" fill="#00407E" cx="16" cy="16" r="16"></circle>
                <circle id="oval-2" fill="#FFFFFF" cx="16" cy="16" r="13"></circle>
                <circle id="oval-1" fill="#00407E" cx="16" cy="16" r="11"></circle>
                <path d="M22.0869565,23.1304348 C18.8173913,22.9217391 16.8695652,21.5304348 16.8695652,21.5304348 L17.8434783,20.626087 L14.0869565,20.626087 L15.0608696,21.5304348 C15.0608696,21.5304348 13.2521739,23.0608696 9.70434783,23.1304348 L8.73043478,20.973913 C10.4,20.973913 12.2782609,20.8347826 12.973913,20.626087 L9.91304348,20.626087 L9.91304348,14.5043478 L10.4,14.5043478 L8.86956522,13.3913043 C9.70434783,11.9304348 9.70434783,10.9565217 9.70434783,9.49565217 L9.70434783,9.14782609 L10.3304348,9.14782609 C13.0434783,9.14782609 13.8782609,9.14782609 15.2695652,8.86956522 L16.3826087,10.8173913 C15.1304348,11.0956522 14.0173913,11.1652174 12.2782609,11.1652174 L12.2782609,11.5826087 L15.9652174,11.5826087 L15.9652174,13.3217391 C16.5217391,12.2782609 16.5217391,10.8173913 16.5217391,9.77391304 L16.5217391,9.2173913 L17.1478261,9.2173913 C19.8608696,9.2173913 20.6956522,9.2173913 22.0869565,8.93913043 L23.2695652,10.8869565 C23.2695652,10.8869565 21.4608696,11.2347826 19.0956522,11.2347826 L19.0956522,11.6521739 L23.0608696,11.6521739 L23.0608696,13.6 L21.5304348,13.6 L21.5304348,14.6434783 L21.9478261,14.6434783 L21.9478261,20.7652174 L19.0956522,20.7652174 C19.8608696,20.973913 21.6,21.1130435 23.0608696,21.1130435 L22.0869565,23.1304348 L22.0869565,23.1304348 Z M12.4869565,13.4608696 L11.9304348,13.4608696 C11.8608696,13.8086957 11.7217391,14.1565217 11.5826087,14.5043478 L12.5565217,14.5043478 L12.5565217,13.4608696 L12.4869565,13.4608696 L12.4869565,13.4608696 Z M19.4434783,15.9652174 L12.4173913,15.9652174 L12.4173913,16.3826087 L19.4434783,16.3826087 L19.4434783,15.9652174 L19.4434783,15.9652174 Z M19.4434783,17.426087 L12.4173913,17.426087 L12.4173913,17.8434783 L19.4434783,17.8434783 L19.4434783,17.426087 L19.4434783,17.426087 Z M19.4434783,18.8869565 L12.4173913,18.8869565 L12.4173913,19.3043478 L19.4434783,19.3043478 L19.4434783,18.8869565 L19.4434783,18.8869565 Z M15.6173913,13.6 L15.6869565,13.4608696 L14.8521739,13.4608696 L14.8521739,14.5043478 L16.6608696,14.5043478 L15.6173913,13.6 L15.6173913,13.6 Z M19.1652174,13.4608696 L18.6086957,13.4608696 C18.5391304,13.8086957 18.4,14.1565217 18.2608696,14.5043478 L19.0956522,14.5043478 L19.1652174,13.4608696 L19.1652174,13.4608696 Z" id="shichi" fill="#FFFFFF"></path>
            </g>
        </g>
    </g>
</svg>
'

module.exports = (display, title) ->
    svg = template.replace('{{ display }}', display).replace('{{ title }}', title)

    if title?
      svg = svg
        .replace(/\{+ width_title \}+/g, title.length * 20 )
        .replace(/\{+ total_width \}+/g, 32 + title.length * 20 + 32)
        .replace(/\{+ x_trail \}+/g, title.length * 20)
    else
      svg = svg
        .replace(/\{+ total_width \}+/g, 100)

    blob = new Blob([svg], {type: 'image/svg+xml'})
    blobUrl = URL.createObjectURL(blob)
