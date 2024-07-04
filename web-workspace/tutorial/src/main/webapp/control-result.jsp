<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// scriptlet

String query = request.getQueryString();
String n = request.getParameter("n");
String control = request.getParameter("control");
boolean valid = false;

int In = Integer.parseInt(n);
char[] arr = control.toCharArray();
if (request.getParameter("n") == null || request.getParameter("control") == null) {
	valid = false;
} else {
	for (int i = 0; i < control.length(); i++) {
		if (arr[i] == 'w') {
	In += 1;
		} else if (arr[i] == 's') {
	In -= 1;
		} else if (arr[i] == 'd') {
	In += 10;
		} else {
	In -= 10;
		}

	}
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<title>Control</title>
<body>
	<div style="text-align: center;">
		<h2>수 조작하기 w=1 s=-1 d=+10 a=-10</h2>
		<p>
			당신의 조작키는
			<%=control%>
		</p>

		<img alt=""
			src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAxlBMVEX///8AAADq7fJVU1Tq7/MrKSwbEhP+/f3q9Paop61zcXI1MzQTEBJcW1v29vYXEhM3NzYTCQzk6+3x9PoXFRYiHyDBv8AMAABFQ0QtKioOAAZ5eXmkoqOwsLMfGh3r7vWDgYLT0tJLS0zn5ubLy8slHiDt7e3c3Nytra1qaGmUk5OLiorh5eifnp69vLz0+fwnJCkjFxsfGBUQCAAYFhV7d33S1dwtJyw+PEEVBRIaFhxqa24QAAW+x8ZAQ0GQlJM8NjxHREv7sOl4AAAMZ0lEQVR4nO2cfYOithbGOYDgQgSRhABqBhVFEGXaunZ2tve2/f5f6gZ3XsRVQcd2V29+/8woOSYPeTskOUiSQCAQCAQCgUAgEAgEAoFAIBAIBAKBQCAQCAQCgUAgEAgEAoFAIBA0Rm+QRG+Q6GfGiueD48xHVqPb8PMyywKg4XEoBNnsRxfyQsq2l/SBMgdO4Wgh9JObrEddGnUAEUyyeJQcZZTxFAg6oxvUaPW5PoKUujY4UzAhGvRvTKClWwr9BQUsqO9kFk9FGVWsGxtUU4RNrwODBo1vDqnXwtC5rYY6B9ZNZgwmDdJO4NHNnxjMb0mh3mLhxu2FyGqQ2HJoT92E0+CWFMaAIlftQXOFbh9B/I+X63osqBOr7X2FunSwq31TGAMs/qXSfRxdSnGQy/KuQr10AfQ3J1TX30fOrUI1D7T0RxT2InRJwV25qnD7vb6fbss3haqpdf6tAl4BBe0rHEYR72a6tYgi7r9ISRStXi/dpkK7q1YVKgBj/scDB1JeeRGA8nppq/BBNu3bVpgh4nBlWTjVfP7Xx072eulOFHpAyulf0dgULF3in0aVkeb2Fc7oFDxJx8zk2qQEmP126U4USl0WLrkyJ0IwlFbAh5U7q0MpcmyDK3NicBbSwg4Hd6dwBcyXImpaU9aROghGb1fuReGEEtAVJ5XGtmm1WPB+5U4U6nqXQBzAkjdXFIO946HdiUJJ6mO0wPz5YU5RhHg3fONuFM6BBARm0ghIi0DyfuFuFCZACOtyQUCmJNhxwu9GoR5gokV8jugyxieOd+5GoZQC8Mmed0igMN/5/k4U8lY5Wa28snHOVqvV7pPinSg8wV0pPLiYdssKacM6DG9WYdP10vtXeLOtVEbchalfx57Bs3yrChVYNVA4BMXtqTep0I2oX99MLZ8u3PYNKpRldYN/RUZtWuO3X9eJeoMKVdntIIKhO5zMjjMZmvaaoY57gwpl9xPQZIAwUM05gmaHoIWfkhA+uTelsNy3MNs5g2URobEyZcchikIjfQnTvHdLCst9i6cihXGR2xAXvfw4vSIGlrtjmhbdm9q36KDg85ffNsWCKsXDKVTVHcOi2CAa/X5TCg3EtDBz5V9h5cqnUYeA224GiGj14+7Pgi4tgazHsjsAv0ZfKfEJBq48XhO6/NEFP4MECMSq2oK5+1CnsD2Hv+R2DJXVqZ+fjv1lKc3BrK9Cmc+EMOS1jm+pG/JKDNnz19aXZV0vLHGX4e8GvrEq1KUBEG36x38Kt57Co1OblMenbug8DWcAjBCSGvWka8K9u0H9T/5sxD5gYtuoFsww+Ld0WugFXdI9I7Cdo07pKwgTw9Nv6cRXBasJP7qQAoFAIBA0YHu09yQ1xs2sD/3KacO6vJswm6dP5jG6XZ+z/U9ZJPsHZPk8Ploo3aPWO79zwJr7OC/W20yejv+On87LrYMLlS4xYMwYPulUEsIwRtBJ9nKZdABhvL140nxrnU72rJOtNePXT5iXV7nTbi8vVDgbA0al2086x+kCZqbCgDnbPfoXeIWs+M2BFiEI/BPm4zJ0KCitVzvW5V4Gt2adoFxSPm6t8LIR4jBQZhcotCzf0R6zJztYnXQc+c1ex7KnUFYWUn8t4xAIVbwlotHpuKBZBGjpKc6utcVvD6EdT45tmp58LtaHAe5mZI1864JaNBz7v/mSBpNtFzne0/U+dNW2mgFDb01NTzCDP9s5lI99p0YJvXxWhtxdAMHvDXUC3NpVVROi05nr0oTAMn9i1Dg/pmgEzOz1HiGus9QtE4ZttVwQTN/SpjjMinZEv9ZYl+VPISq4xF1rRP9sP7hDMGsjTHUPWnLeKo/lnqswxeAVHpi1CXUpg8+uLLtjTJOXXCaw/tvtqU+N8o3B5zfoibwFSSWwHhe9h7YBTdYXg205beNchRbCitseQP0qrc6LqJQKh5S+LkUMgA7dtvoFGu1yg9ZTH4ZAX48RLQGGqvrQHjeKEzJg3nbH60Yb6ruMgGauO4CoNqXO044LWVbz9zOVfVRuCfZg3XgfX90wp//yRYpALhX6O8dsj+feh0HbzZwGaat4/D42U1jejTGvQ7VgmvKSaweVK6XnnBhS1cB5XTAdY8J/r5lCaauwPaTgNUi7y+oShczfftYl5XyF8nvMjI+D4ocp/BZ+ttenXxUSzX/55nDck3R4YPwuKogr/K4Ojw8jpUL12nVYr7DmXFvVg90/T3NQoX7QVrp+K50vsmy4911zhfqqr4zTLDlfoaTPF30jNRbzfSfnugr1CTjOdyNkY4UTH5Cm2e9BXWco5Dkj5GhOuPXxd27Rletwzr0rsj9NNVWodzFxbBxCVjFvqNCZMhIQpzzf4Un/lEKdT1UkxSiqpm2qkPvTMLf0yarqjDdVyMo7O8kof17Z/YHr1qHFndUYWOsyhZnDyPYf/YJ+yOvwW9vhzQjtRgxfV6EHWrqNrLtI4YASyPTvppszFUo+I7u3+LoK+xp/zu1gVO1ITRVOQkLALN/W8gGFehmsuevvXrcfmoxOeDPBTxcplFbUnjIK0YdaqTQIye67Gq6qcATYt6wE7e1INx5LpcTgYyGBalj6uQqXThl6888o5O2DmIFJSFjZsW2ukBd0icnedHOuQsMmaMf8qgp9NnWcEGGCK3N2Q4X6i0Y+Flb68TkKefueYbYb+XZVhQmd2v3FYpHiSkdorPDb0rLEp/3LFUp6iqaVNnBNhQM6/WWrlM8Xu75p01Y6SwejWRLxblwpTWOFdGVN5mNuXll4uKZCBW+P/OpWd8p220lThfPtu694CS/yS51y7RVCTYO08qvXU6hbvHjlUkq5cMDL/j7kN1W45GYIUfhqXfD0NNm+GYwCKKvqfHpFhZI3HG5LrM+G813nt2k/tEbzqB8N9t9d1vD50FtmWTbwZvs+0b+5itH8CbhCw+fDY+Z3o/AoN6EQfm6F+ocVQvhzK/x4HdIPK/zIWlu/PqkUH1MY0o/UYeE3XtW/vA5XYNa+QbXcH/t6UKFs1leCXjbyJ7USFfRNoeqmlYDoY7mb4D1cXIcP+bR+90iX/DLk5YBC9zNvAvW12IfIPahwAOP6/aQRtHL38lbqaaxbW8QFsHGuHlCYm2R38/pYTg425fb3Ch9yn+ytyh3AMhny3ItbaR6sHWSe7gwzAxBQP1f3FaozBVEMy9N3yMq4uaZwhd2qQjX/y/mCwDj95sXYfP6i/V7u7F2msO/4KxND98RZZsV20DJpwThvVxXKbgQsNhAKOqdOQBN47scMokKt1qGb/43MzdJG+JT5E2jm6gk+F5cp9DwIY54dOv2aXOYsi00LlF5VYfEJwlWxQIyeNKfYyYrt7azUYZGP/3jcFEunJndNGxcxL+rqfIUesI4JWeHB48b7dJxhPgSIiw2jymyNy1eylcNjBwfDEDJ3o4G3GZ4y36xAy4uMP7UEbwrHmMkKfdy0edmHySlzb8MgdhcQdMjZCvlT7vOzrxYdPtC1j8MHQdcA3iQ3BBFsv86efUSc0FDdr9ApUxy3571XAaNwvyJE7OjF2sCEOY8bNzdDg5ufyr2IIHVdH7PzwzUsTKbPSXsEkPBRQD1Kr6dOAhq5bvzIpi/zl16uS//ql6E+EKu948alvcoTbdo9H7+vG5TWvAbdz/Qvudc7Yd9T2wnQjTpChEzPPi7et9eGVPTp19qwF9cDWD24Q8TQa3D6DKa86bYVatQHzbgG7bjt8o11r0uEEzSFYdvlzd+rjZrizeRzURgY9c8+bZIAe9yMnssArbpcikX4nLt82Hx38fqObfABBOW1xrKaYFgVhr1TRsOxP7s5posGQUUxsGRELoop4hM5Y5pSyKcLWbaWtu/4HYTJ+/sFZoFm+4QPk/VFVIuFQ3yEWzvWU+Z0fNsv6u8u78c24QIXZ1ch90Y7QAjm3kot7dmY3wtW2XWPuWCConpjTmRPGaO7LmwMZM3YuIGtLP/NplO4JO5Nl6wUysOTj61aCM/EYTsebOlPM8qNSb1xiyA2DXF1wSLGaMplN7BGz1MGxmUnaXWJuwvI0RrggBPtvgKjzNCKULmnXYu9dii33i3j1tqhdgNrbP8B3dXlYW96nHWUejr9+aEzlrNhv4m1Eh20nswbWadZ/IGT0GeYfuy89ffW5/zehwKntgdIG6bc+1z5U2t9OOtG5rcb9yYQCAQCgUAgEAgEAoFAIBAIBAKBQCAQCAQCgUAgEAgEAoFAIBAIBAKBQCAQCP5P+R/i3K2l7xkQrQAAAABJRU5ErkJggg==">
		<%=In%>
</body>
</html>