class Book {
  final String title;
  final String urlImage;
  final String detail1;
  final String detail2;

  const Book({
    this.title,
    this.urlImage,
    this.detail1,
    this.detail2,
  });
}
//assets/diseases/a.png
const allBooks = [
  Book(
      title: 'โรคหลอดเลือดหัวใจ',
      urlImage:
          'assets/images/a.png',
      detail1:
          'มักจะเหนื่อยง่ายเฉียบพลัน เวลาที่ออกกำลังหรือต้องใช้แรงจำนวนมาก หายใจหอบ หายใจเข้าได้ไม่เต็มปอด และไม่สามารถนอนราบกับพื้นได้หน้ามืด เวียนหัว และแน่นหน้าอก เนื่องจากความดันโลหิตต่ำแบบเฉียบพลันเจ็บหน้าอกเหมือนถูกเค้นแรงๆ หมายรวมไปถึงอาการร้าวตั้งแต่ คอ กราม ไหล่ และแขน 2 ข้างในกรณีที่รุนแรง อาจหมดสติหรือมีภาวะกล้ามเนื้อหัวใจวาย',
      detail2:
          '1.การใช้ยา 2.วิธีขยายหลอดเลือดหัวใจด้วยบอลลูน (Balloon Angioplasty) : วิธีนี้จะช่วยดันไขมันอุดตันให้ชิดกับผนังหลอดเลือด ขยายหลอดเลือดที่ตีบตันให้เลือดสามารถวิ่งผ่านได้สะดวกมากยิ่งขึ้น 3.การผ่าตัดทำทางเบี่ยงหลอดเลือดหัวใจ (Coronary Artery Bypass Grafting) : วิธีผ่าตัดทางเดินเลือดหล่อเลี้ยงหัวใจใหม่ ด้วยการสร้าง “ทางเบี่ยง” หรือที่รู้จักกันว่า “การผ่าตัด Bypass” โดยใช้หลอดเลือดจากส่วนอื่นมาต่อเข้ากับหลอดเลือดหัวใจบริเวณที่ตีบหรืออุดตัน เพื่อให้สามารถลำเลียงเลือดและออกซิเจนไปหล่อเลี้ยงกล้ามเนื้อหัวใจได้ดีขึ้น'),
  Book(
    title: 'โรคเบาหวาน',
    urlImage:
        'assets/images/b.png',
    detail1: '',
    detail2: '',
  ),
  Book(
    title: 'โรคความดันโลหิตสูง',
    urlImage:
        'assets/images/c.png',
    detail1: '',
    detail2: '',
  ),
  Book(
    title: 'วัณโรคที่มากับอากาศ',
    urlImage:
        'assets/images/d.png',
    detail1: '',
    detail2: '',
  ),
  Book(
    title: 'โรคปอดเรื้อรัง',
    urlImage:
        'assets/images/f.png',
    detail1: '',
    detail2: '',
  ),
  Book(
    title: 'โรคภูมิแพ้',
    urlImage:
        'assets/images/e.png',
    detail1: '',
    detail2: '',
  ),
  Book(
    title: 'โรคระบบประสาทจิตเวช',
    urlImage:
        'assets/images/g.png',
    detail1: '',
    detail2: '',
  ),
  Book(
    title: 'โรคระบบกล้ามเนื้อ เส้นเอ็นอักเสบ',
    urlImage:
        'assets/images/h.png',
    detail1: '',
    detail2: '',
  ),
  Book(
    title: 'โรคอ้วน และน้ำหนักตัวเกิน',
    urlImage:
        'assets/images/i.png',
    detail1: '',
    detail2: '',
  ),
];
