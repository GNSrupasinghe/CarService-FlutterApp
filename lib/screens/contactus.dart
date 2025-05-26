body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image(
                image: AssetImage("./assets/map2.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "EMAIL -   cars@gmail.com",
                    style: GoogleFonts.jockeyOne(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "MOBILE NUMBER -   077 896 3333",
                    style: GoogleFonts.jockeyOne(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "LAND NUMBER -   011 255 3698",
                    style: GoogleFonts.jockeyOne(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "ADDRESS -   JA ELA",
                    style: GoogleFonts.jockeyOne(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
