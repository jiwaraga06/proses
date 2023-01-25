String baseUrl = "https://api2.sipatex.co.id:2096";

class MyApi {

  static token(){
    return "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJuYW1hIjoicm9vdCIsImVtYWlsIjoicm9vdEBsb2NhbGhvc3QifSwiaWF0IjoxNTkyMjM1MzE2fQ.KHYQ0M1vcLGSjJZF-zvTM5V44hM0B8TqlTD0Uwdh9rY";
  }

  static detkp(id_partai) {
    return "$baseUrl/jobs/DetKP?IdPartai=$id_partai";
  }
  static jodetkp(id_partai) {
    return "$baseUrl/jobs/JODetKP?IdPartai=$id_partai";
  }
}
