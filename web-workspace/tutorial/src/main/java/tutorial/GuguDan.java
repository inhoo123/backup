package tutorial;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 *구구단 랜덤 단을 HTML 로 응담을 보내주는 서블릿을 만든다음.
 *  /gugudan.h2 이걸 어딘가에 매
 */
@WebServlet("/gugudan.h2")
public class GuguDan extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		int number = 1 + (int) (Math.random() * 9);
		int numbers[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
		int r = numbers[number];
		out.print("<!DOCUMENT html>");
		out.print("<html>");
		out.print("<head>");
		out.print("<title>" + number + " 구구단</title>");
		out.print("</head>");
		out.print("<body>");
		out.print(
				"<img src=data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAQDw8PEA8PDw8NEA8PDw4PDw8NDQ0NFREWFhURFRUYHSggGBolGxUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OFRAPFSsZFRkrKysrKysrKy0rKy0tKy0rNy03LS0tKzc3LSsrNzctKystLSsrKysrKy0rKysrKysrK//AABEIAOIA3wMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAACAAEDBAYFBwj/xAA7EAACAQIDBgMGAwcEAwAAAAAAAQIDEQQFIQYSEzFBUWFxkSIyQlKBoQcUYhUjQ1OCkrFy0eHxFiQz/8QAGAEBAQEBAQAAAAAAAAAAAAAAAQACAwT/xAAcEQEBAQEAAwEBAAAAAAAAAAAAARECEiExAxP/2gAMAwEAAhEDEQA/ANBFDqIokkUcnPDqIW6Eh0iUNFEiiMkSxRNUygGohpBRRMlCIaiOh0iBRiSKI8EGkOkMYhxiHCIVi1aFRJYwFAkGLSURboYW6KiCxnNo8rm7VqOlWnrp8S7GqURnAixuRbStSs3uVFpOlLRS8jWUdpKDjeo3B9VZy/wcLPNlaWIe+vYqc96OmpncRs9mFPSE+IunUg27z7Baviv+2Rn9odrVKDpYdOCd1Kd9WvA4MckzCTtKO6no3odjK9j7NSrz3/0rkSxS2cyp1J8aadl7t+bfc2G5pbwsS0qCglGKsl0CsFq1lsxyWd26cnZ/Ddo5lHI60ZXUVGXdG8cSOUTJ1mUiSKBSJEiIkiRRBiSIgSiSRQ0SRIlSSJYxGigkTIlEJIdBJERQQaQooOxIooOw0QiBkSrUFIkjEYjpBWHUAlA0gDtBKAW4R1XsJRJd1DolqFxB3SeRHYKkbiDYlaI2ZQQZRJLAtEGWiGgYkkUTQooNDJBoieKJYoBEkUQGFBDIkRA6JIoCJI5Jc2l5uxISRIolWWLpx1dSCt+pFR7S4RaOslbwZYnXsOkcSe1eDX8VPyTJcJtJhZ8qiWtrPmOB2EiaCIaVaMrWad+z1LEUOIUQkhRDSFBsOFYVgSFiCmgbCjMFqwbQxJG0DYmI2gqAwGSMGSBMskHBAoOINjQcUDEkiSOg4jRDQA6JUiM5u02ZrC4StW5bkXb/AFPRCmc2326jhJOjRtKqvel0h/ueZ4zbLFVG5Sqyd+l2kZ7G4qdWcqk23Kbcn4tla5qBoFtJVvq2/NsOO0kuqRnBJmk1UM83tORKs1in7zuuqMkmw1JloejZRthuWjvSv817G5yvbOe6nvKpHs+b+p4FGT7nXynPKlGS6x6p9hD6TyXaOliLRfsTfRvRvwO8eG5XndOaUoy3Zqz16M9d2dzHj4eE73fKWt9V1CwuqMxxgRpDRE2OiQWgQ2AyRgGGC0FQGhmggWCZWwcRkEkTY4kiAiiVIAeIaAQaAjR57+MuYbmFp0U9a0/aXeKR6EmeK/jNi9/GU4X0p02mvG5rE89uIYRoEOIYkIdMEdMtCRBwRGmSQEOvgari00+R67+Fuc+3KhJ6VFeK/UeL4StZ2Zstlcfwa9GtF+5JX8hT6ISEQ4WupxjOLupJNMmMozQ1x2wSR2Cx7jMgZgjjBSFgSJGBIEyyDQCDQOiSLJCOBIQOg4gIkiSPc+dNu8ZxsxxM07rf3V/TofQeZV+HRq1PkhKXoj5jx1fiValT55yl6sYFcQhGkQhCJEOhh0AESRZGiSBqBJE6+S4vddny0OZSiWqKsxT6I/DrM1Wwije8qTt5R6GrPHfwozTcxHCcvZrK1u8lyPYgRMYcYEQLYTBZIgWxXGkwqJsBj3GYJl4hpgxCQVtJAO5HANFCkiEmZPbrOK+FoxnRVk9JT5uB5tV2hr19ZYh+adhwPVdsc1pQweJhxYb8qco7u8r6o+djuZ03u7zqym5aau5whkBCEIUQhIexIw4W4+wcMNJ9CQIskjIsUsrqS6F2lkVR2e8l9BjNU6VVFuE7nSp7OVf5kfQP/wAcqr44P6GgtbNY/g16VRc4Ti/ufROFrKcIyTTUkno/A+b1k1aOvsu3RXTLdDGZhQnelWnFJaQbul5Gao+jLjni2VbeZlT0qQjWXjoz0LZnayGLtGUJU6j+F8m/AC0zZG2EwCRwWxwQqMxNiBkBZuIQCYUQrUSRDRHEkQFHiMNCrFwnFSjJWcWrpnmm0/4YtuVTByVtXwZPl4I9SiEkOh845ps7jcMlx6UoKWkbtO5yakXF2aPbvxRwMqlClUS0pz9ryZ5Rm1JWWnIPJqcORTSfwk6oR6plrK6PXudWNDw+w+ZnDgqjDx9CaEKXc7E8P4ALCrsvQZReFWlCl8y+xbo8L5o+qGlgo/KRPAr5R8oz4OpRnTXxR9UX6dWmre3H1RmHg12GWC8B8ov51s4Y6iv4kfUeWc4dc6iMpSwa7FuGEj2XoX9Iv5131nVF6Q3pvtGLk/RE9GpVrO1LC1pvxg4/5H2DgoY2lZLXQ9pSLz1m848qwWzWPqv/AOEaC71Xq/Q2Ozmyqw0lVqT36q7aRi/A0gkWgbkDca4LYVDGuBca5lDbAuNcZskzqCizPrNqvyL1JFm9X+UvX/g1Y3HfiyRM4Ec1rfyl6hrH13ygl9zOF3kw0zgxxWI7ItQxVa3uR+44E2fUFUw1aLV/Yk0vFLQ8LxVLVqXQ97w1Xfi7rVaSXQ8v2py2NHEVIpezN7y+py69O3FZfB0Ulpy6HRpxId2xPRZjXWQapXJFh12HiTRGdKxUdAjqRSOjKOhyMZdy3eSZrWcQt3ehYjQfYalWo05KHU6TxMEg04rUqROqIqKTd1qmWWg1Y6uxVBvG0rfDq/I9eTPPfw6wSdSdZ/Ct2P1N/c681w6+pLg3AbFvGnMTY1wd4VwFOIFsTZI9wZDMYAyCjDsg1GPY5H5vxHWOt1O0TtxjHsSwSXQ4SzDxH/aXiJd/iJDSx0EZ2rmWnM5eKzW19QqbjKcdCWI4bkkqsbW/V0KmdZXTxbdN06m/TbSnGDv/ANGPybNL4zDa/wAWK+51NuNrsRhcwrUo1asKacd2MHFK26u6OfU089Yze1mQSwM6cZSb4sXJXW7omciiW9pM/eNlTnKdSbpxa/eNN6u/TyKNCZ5+p7ermrsCaBFTZNEy6DfIp4nD73mW5vQiuWpUhgle7Sv36kksKmgqmIjHqRfnYilvDxtp2J2ynQxClyOnl2GdWrTglrJq/l1Jm3HpOyWC4WGh3n7fjZnb3ivh4qMYxXKKSRMdo8dvtImNcASZoCuIEa5AdxrjXFcCdsFsTYDFPFZ5kRyzTx+5nJ41shliH3OijTftV9xftR9zLfmH3HWJ8SLSzzN9yrWxe91OL+Y8RKv4gXUwOM4delK7vCcZX7WZp/xmf/tYWa51cNGbfd6GBeLSab1t2L+0209bMatKTpxhwaapQS1W6urC0Se0OG1RapSsyvhINJJ8yaUTzdX29PLpUayLMKqOPSqWJ1XMt66c56HOxtR9GSRrMjqx3iWqdON+rHlSRJ+VXexNSoJeJvWtizgaKivM9F2Jymy/MTVnJWgmuS7mFynE0YVoOvrBO7j3PU8qznD1YxVOcVppB6NI3zxfrzd9x10wlIi3wkzeOSRSEmR3FcEluC2Dce4g+8K41xmyWFJg3ExCny5xAeIQuQoJvkaUTcQKLb5BQw6XvS+iDlioxVopLx6jh1HP2eehC6l+RHVquXM6OzuGU6vtco2bXcz1cmme66WR7O8RcWveNPpFaSkWsVCEXu04qMF2Wr8zpYuvyS5Wsc+UTydd213nMQU4E7paCpwJkjMaUJRsNGZdqQKtSmaQoVSR1L8im7hRcuhLU92HGru2v1Y9KF+ZVziW7wvNv6WOv5TemO+snos0p/GgctzedN+89PEOlWUk4vm0crFUXGTPfkeO3XpORbaTjZSlvLtLU2mW7T0aqSk9xv0PAcPVafM7+Ax7VtWZvEq171TqJq6d0+q5BnluU7T1KTVp3j8r1Rs8n2npV2ov2Jv0Zx6/OxuV3xXGUh7nMlccFDjpIVxXGbLVj5ipYFfE7+A9R7uiVhniLDuopHoyMKNSbuRuRLXjqVzFakPc6GS192oulznBwlZp9mYs2Y1G2TuO4lTLa6nBMvWPLZjvKCKJIoW6IMJSRHKJOlcbgmsStw0SwpIlVEOMAKLdsZ3Nq+/U05R0R2c1xKhFrqzLuV3c7fjPbj+l9J1WtKL5F/GQ3oqS6nIqu1jsYZ3pHsjzuRJ2YUcU0NjIWZWbC3FjrYPMWmtTtVMz3FGSdn4czJUnqi3iavumvLU9l2L2tjVjGjWladrRk+vgzao+dsDi3BxcXZrkz2LYraD8zT4c3+9ppf1ROHfOfGtaqI4yQ5x1uGGaCsKw6XytVZCp2DkyJna1iDdS4AwrgTjMeKvoTywrSv8AYCs5Tj+HK0n7L+xrqFRSSad0zA2Olleauk7O7j/gx1zrfPTY2QE0QYbGwmrqS8upNKSOV5b08WTRKqmHxkuoYdWGVMZilBPWxXxuaRguepmcfmEqj56DOLReh5jjN+XPQjwMN6aXNXu/IqwTbsuprMkyxRjeS1l1O/Mxw6uq2aZQ5w4tKPLnFLp3SKeUz0cX6Gwya9OpuTlenLk+zIs+2dSfHorXnKK92XivE7c1zrL4/D6M40kaqo1JWejWjT5pmextKzY9KK0ZaktSXLwIESSfI561V3DSuaHIM2lh60KkXrBq6+aPVGdw+iLNF63OubGX0XlOYQxFKNWD9mS+qfYvKJ49sJtM8NUVKb/dVGr3+F9z1hZnQtfiw1/Ujy9843Ktbot0pyzegv4sP7kD+2sP/Opr+pGDr5bQDEI7oLEIRFawK1LzEIhXPxPvEIhAokozakrNrydjQYWpK3N+rEIx03ylc3bm/UoYub7v1YhGS49STb1bYIhHVh08jS4i0NhTEIWD1jsZW26Mru+r5iEb5ZrIZyrVpW05HGx3IYRroxzg+whHNpeo8kWughHafGDUny8y7ia07+9LkviYhGb9KFV5/PL+5k1GpJ85N/ViEZD/2Q=='> ");
		for (int i = 1; i <= numbers.length; i++) {
			out.print("<li>" + r + " X " + i + " = " + r * i + "</li>");
		}
		out.print("<p> " + r + "구구단이였다 </p>");
		out.print("<p>나이스!</p>");
		out.println("</ul>");
		out.println("<p>열공하세요!</p>");
		out.println("<p>");
		out.println("<a href='./fortune.pwh'>운세확인하로가기</a>");

		out.print("</body>");
		out.print("</html>");

		out.close();
	}
}
