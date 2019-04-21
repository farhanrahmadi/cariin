final RestaurantDetailModel dataDummy = new RestaurantDetailModel(
    "Sate Pak Jengot",
    "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_412,c_fill,g_auto,h_232,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F181220174053-02-best-new-restaurants-2019-artyard.jpg",
    'http://jadiberita.com/wp-content/uploads/2017/09/Crystal-Widjaja-Inovasee.jpg',
    "Jl. Mulu jadian kaga",
    "10:00 - 22:00",
    "Indonesia, casual",
    "30-60m",
    "@sateinternasional",
    "08128003225",
    4.1,
    4.2,
    4.0,
    4.1,
    1256,
    [
      new RestaurantDiscount(
          "Bayar Pake danamon",
          "https://ucarecdn.com/5a6de157-f8ba-46bc-baa5-34f06f6d07d3/Promo_PartnerDanamon.jpg",
          "XXX24344",
          "22-03-2019"),
      new RestaurantDiscount(
          "Bayar Pake Citi",
          "https://ucarecdn.com/1dd6fdbf-492f-40fe-b46a-5a49e1c0493e/c.jpg",
          "XXX24344",
          "22-03-2019"),
      new RestaurantDiscount(
          "Bayar Pake ocbc",
          "https://ucarecdn.com/4e05b01a-3add-4dbd-b2b7-ef3fd62c06ca/Promo_PartnerOCBCKAMIS.jpg",
          "XXX24344",
          "22-03-2019"),
    ],
    [
      new Comments(
          "Raditya Dika",
          "http://1.bp.blogspot.com/-gArX3CpISn8/TlauqaCxtII/AAAAAAAABF4/snVKmzXprok/s320/Radith.jpg",
          "03-03-2019",
          "makananya enak sih cuma harganya lumayan mahal",
          3.9),
      new Comments(
          "Raditya Dika",
          "http://1.bp.blogspot.com/-gArX3CpISn8/TlauqaCxtII/AAAAAAAABF4/snVKmzXprok/s320/Radith.jpg",
          "03-03-2019",
          "makananya enak sih cuma harganya lumayan mahal",
          4.2),
      new Comments(
          "Raditya Dika",
          "http://1.bp.blogspot.com/-gArX3CpISn8/TlauqaCxtII/AAAAAAAABF4/snVKmzXprok/s320/Radith.jpg",
          "03-03-2019",
          "makananya enak sih cuma harganya lumayan mahal",
          5.0 ),
    ],
    [
      new Payments("Cash"),
      new Payments("Ovo"),
      new Payments("Dana"),
      new Payments("Gopay"),
    ],
    [
      new MenuType("Makanan"),
      new MenuType("Minuman"),
      new MenuType("Minuman Dingin"),
      new MenuType("Minuman Panas"),
      new MenuType("Minuman Western"),
      new MenuType("Fine Dining"),
    ],
    [
      new Menu("SateNih", 200000.0, "https://via.placeholder.com/600", true, "30m", 0),
      new Menu("Sate Lagi", 200000.0, "https://via.placeholder.com/300", true, "30m", 1),
      new Menu("Es Kopyor", 200000.0, "https://via.placeholder.com/300", true, "30m", 2),
      new Menu("Legen", 200000.0, "https://via.placeholder.com/300", true, "30m", 3),
      new Menu("SateNih", 200000.0, "https://via.placeholder.com/300", true, "30m", 4),
      new Menu("SateNih", 200000.0, "https://via.placeholder.com/300", true, "30m", 5),
      new Menu("SateNih", 200000.0, "https://via.placeholder.com/300", true, "30m", 6),
    ],
    new Facilities(true, true, true, true),
    new RatingDetail(0.0, 3.5, 4.5, 4.8, 4.5),
    true,
    true,
    true);

 final List<Order> orders = [
   Order("Sate kadal",50000.0,"https://via.placeholder.com/300",1),
   Order("Sate luwak",75000.0,"https://via.placeholder.com/300",1),
   Order("Jus Satan",1000.0,"https://via.placeholder.com/300",2),
   Order("kerupuk kentang",2000.0,"https://via.placeholder.com/300",2),
   Order("tetelan kadal",7000.0,"https://via.placeholder.com/300",3),
   Order("Air putih",1000.0,"https://via.placeholder.com/300",2),
 ];

class RestaurantDetailModel {
  final String name;
  final String bgImagePath;
  final String profileImagePath;
  final String address;
  final String workHour;
  final String typeFood;
  final String timeEstimate;
  final String instagramName;
  final String phoneNumber;
  final double overallRating;
  final double menuRating;
  final double placeRating;
  final double serviceRating;
  final int reviewersCount;
  final List<RestaurantDiscount> discount;
  final List<Comments> comments;
  final List<Payments> payment;
  final List<MenuType> menuType;
  final List<Menu> listMenu;
  final Facilities facility;
  final RatingDetail ratingDetail;
  final bool isVerified;
  final bool isOpen;
  final bool isDelivery;

  RestaurantDetailModel(
    this.name,
    this.bgImagePath,
    this.profileImagePath,
    this.address,
    this.workHour,
    this.typeFood,
    this.timeEstimate,
    this.instagramName,
    this.phoneNumber,
    this.overallRating,
    this.menuRating,
    this.placeRating,
    this.serviceRating,
    this.reviewersCount,
    this.discount,
    this.comments,
    this.payment,
    this.menuType,
    this.listMenu,
    this.facility,
    this.ratingDetail,
    this.isVerified,
    this.isOpen,
    this.isDelivery,
  );
}

class RestaurantDiscount {
  final String name;
  final String imagePath;
  final String code;
  final String expDate;

  RestaurantDiscount(this.name, this.imagePath, this.code, this.expDate);
}

class Comments {
  final String name;
  final String imagePath;
  final String date;
  final String comment;
  final double rating;

  Comments(this.name, this.imagePath, this.date, this.comment, this.rating);
}

class Payments {
  final String method;

  Payments(this.method);
}

class Facilities {
  final bool isAc;
  final bool isParking;
  final bool isWifi;
  final bool isVip;

  Facilities(this.isAc, this.isParking, this.isWifi, this.isVip);
}

class RatingDetail {
  final double oneStar;
  final double twoStar;
  final double threeStar;
  final double fourStar;
  final double fiveStar;

  RatingDetail(
      this.oneStar, this.twoStar, this.threeStar, this.fourStar, this.fiveStar);
}

class MenuType{
  final String name;

  MenuType(this.name);
}

class Menu{
  final String name;
  final double price;
  final String imagePath;
  final bool isDelivery;
  final String estimateTime;
  final int typeId;

  Menu(this.name, this.price, this.imagePath, this.isDelivery, this.estimateTime, this.typeId);
}

class Order {
  final String name;
  final double price;
  final String imagePath;
   int qty;

  Order(this.name, this.price, this.imagePath, this.qty);

}
