class Banks {
  static List<Map<String, String>> banks = [
    { 'nameEn': 'SAUDI HOLLANDI BANK', 'nameAr': 'البنك الأول', 'bic': 'AAALSARI' },
    { 'nameEn': 'BANQUE SAUDI FRANSI', 'nameAr': 'البنك السعودي الفرنسي', 'bic': 'BSFRSARI' },
    { 'nameEn': 'AL INMA BANK', 'nameAr': 'بنك الإنماء', 'bic': 'INMASARI' },
    { 'nameEn': 'ARAB NATIONAL BANK', 'nameAr': 'البنك العربي الوطني', 'bic': 'ARNBSARI' },
    { 'nameEn': 'AL RAJHI BANK', 'nameAr': 'مصرف الراجحي', 'bic': 'RJHISARI' },
    { 'nameEn': 'BANK AL-JAZIRA', 'nameAr': 'البنك الجزيرة', 'bic': 'BJAZSAJE' },
    { 'nameEn': 'BANKMUSCAT', 'nameAr': 'بنك مسقط', 'bic': 'BMUSSARI' },
    { 'nameEn': 'EMIRATES BANK INTERNATIONAL PJSC', 'nameAr': 'بنك الإمارات الدولي', 'bic': 'EBILSARI' },
    { 'nameEn': 'FIRST ABU DHABI BANK', 'nameAr': 'بنك أبوظبي الأول', 'bic': 'FABMSARI' },
    { 'nameEn': 'JPMORGAN CHASE BANK, N.A. RIYADH', 'nameAr': 'بنك جي بي مورجان تشيس', 'bic': 'CHASSARI' },
    { 'nameEn': 'BNP PARIBAS SAUDI ARABIA', 'nameAr': 'بنك بي إن بي باريباس السعودية', 'bic': 'BNPASARI' },
    { 'nameEn': 'GULF INTERNATIONAL BANK B.S.C., RIYADH', 'nameAr': 'بنك الخليج الدولي', 'bic': 'GULFSARI' },
    { 'nameEn': 'BANK AL BILAD', 'nameAr': 'بنك البلاد', 'bic': 'ALBISARI' },
    { 'nameEn': 'NATIONAL BANK OF BAHRAIN', 'nameAr': 'البنك الوطني البحريني', 'bic': 'NBOBSARI' },
    { 'nameEn': 'NATIONAL BANK OF KUWAIT', 'nameAr': 'البنك الوطني الكويتي', 'bic': 'NBOKSAJE' },
    { 'nameEn': 'SAUDI NATIONAL BANK', 'nameAr': 'البنك الأهلي السعودي', 'bic': 'NCBKSAJE' },
    { 'nameEn': 'RIYAD BANK', 'nameAr': 'بنك الرياض', 'bic': 'RIBLSARI' },
    { 'nameEn': 'SAUDI BRITISH BANK', 'nameAr': 'البنك السعودي البريطاني', 'bic': 'SABBSARI' },
    { 'nameEn': 'SAUDI ARABIAN MONETARY AGENCY', 'nameAr': 'مؤسسة النقد العربي السعودي', 'bic': 'SAMASARI' },
    { 'nameEn': 'SAUDI INVESTMENT BANK', 'nameAr': 'البنك السعودي للاستثمار', 'bic': 'SIBCSARI' },
    { 'nameEn': 'STC Bank', 'nameAr': 'بنك إس تي سي', 'bic': 'STCJSARI' },
    { 'nameEn': 'D360 Bank', 'nameAr': 'دال ثلاثمائة و ستون', 'bic': 'DBAKSARI' },
    { 'nameEn': 'Standard Chartered Bank', 'nameAr': 'بنك ستاندرد تشارترد', 'bic': 'SCBLSAR2' }
  ];
  static String getBankAtIndex(int index) {
    if (index < 0 || index >= banks.length) {
      throw RangeError("Index $index is out of range for banks list.");
    }
    var bank = banks[index];
    return bank['bic']!;
  }
}
