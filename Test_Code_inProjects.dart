 Card(
  //
            color : Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 190,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffE3E3E3),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/modern_chair.png',
                            width: 130,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 38,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'NEW',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                width: 38,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffF4BB00),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Color(0xffFFF0BA),
                                    ),
                                    Text(
                                      '4.8',
                                      style: TextStyle(color: Colors.orange[800]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Modern Chair',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Armchair',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff828282),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Gap(10),
                    Text(
                      '₹ 12,500',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Gap(80),
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryFontsColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Image.asset('assets/+.png', width: 20),
                      ),
                    ),
                    Gap(10),
                  ],
                ),

                Gap(15),
              ],
            ),
          ),
