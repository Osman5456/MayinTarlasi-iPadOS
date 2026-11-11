# MayinTarlasi - Gercek iPadOS Uygulamasi

Bu proje, daha once hazirladigimiz 9x9 ve 10 mayinli MayinTarlasi oyununu
SwiftUI + WKWebView ile **yerel / internet gerektirmeyen bir iPadOS uygulamasina** cevirir.

- Oyun mantigi `MayinTarlasi/Web/index.html` dosyasindadir.
- iPadOS uygulamasi `MayinTarlasi/Sources/MayinTarlasiApp.swift` dosyasindadir.
- `project.yml`, XcodeGen ile Xcode projesi olusturur.
- `.github/workflows/ipados.yml`, GitHub Actions ile **imzasiz** IPA uretir.

## Windows uzerinden IPA nasil olusturulur?

1. https://github.com adresine gir ve hesabina giris yap.
2. **New repository** ile `MayinTarlasi-iPadOS` isminde yeni bir depo olustur.
   Bu projede gizli anahtar bulunmadigi icin Public veya Private secilebilir.
3. Bu ZIP dosyasini Windows'ta **Tumunu ayikla** ile ac.
4. GitHub'da depo sayfasinda **Add file > Upload files** sec.
5. Acilan klasorun ICINDEKI dosyalari ve `.github` ile `MayinTarlasi` klasorlerini
   sayfaya surukle. Dosyalarin govdesinde `project.yml` gorunmeli.
   Eger `.github/workflows/ipados.yml` yuklenmezse workflow tetiklenmez.
6. **Commit changes** ile kaydet.
7. GitHub'da **Actions** sekmesine gir. `MayinTarlasi iPadOS IPA` islemini ac.
8. Otomatik baslamadiysa **Run workflow** de. Sonucu bekle.
9. Basarili islemde alt kisimda **Artifacts > MayinTarlasi-iPadOS-IPA** gorunur.
   Indirdigin ZIP'i ayikla; icinde `MayinTarlasi-unsigned.ipa` vardir.

## IPA'yi iPad'e kurmak

Bu IPA **IMZASIZDIR**. Dosyaya tiklayarak iPad'e yukleyemezsin.
Windows'ta Sideloadly (https://sideloadly.io/) ile kendi Apple hesabin
uzerinden uygulamayi imzalatip kabloyla iPad'e yukleyebilirsin.

Genel kurulum adimlari:
1. iPad'i Windows'a USB ile bagla; iPad'de bilgisayara **Guven** de.
2. Gerekirse Apple aygit suruculerini / Apple Devices ya da Sideloadly'nin istedigi iTunes'i yukle.
3. Sideloadly'yi ac. IPA dosyasini surukle, iPad'i sec, Apple hesabinla
   imzalamayi tamamla ve Start'a bas.
4. iPad'de Ayarlar > Gizlilik ve Guvenlik > Gelistirici Modu'nu etkinlestir
   (bazi cihazlarda ilk eslestirmeye kadar bu secenek gozukmeyebilir).
5. Gerekirse Ayarlar > Genel > VPN ve Aygit Yonetimi'nden gelistiriciyi onayla.

### Onemli sinirlamalar

- Ucretsiz Apple gelistirici hesabi ile imzalanan uygulamalar genellikle **7 gun** calisir;
  sonra ayni IPA'yi yeniden imzalamak / yenilemek gerekir.
- Kurumsal yonetilen iPad'lerde gelistirici modu veya yandan yukleme kisitlanabilir.
- App Store / TestFlight dagitimi icin genellikle ucretli Apple Developer Program
  ve gecerli dagitim imzasi gerekir.
- Apple hesabinin parolasini asla GitHub projesine, ZIP'e veya herkese acik depoya ekleme.

## Mimari

- Uygulama `WKWebView` icinde **yerel HTML** yukler; Netlify adresine baglanmaz.
- Hicbir harici JavaScript kutuphanesi yoktur.
- Oyun iPad'de internet olmadan calisir.
- Kutu acma, bayrak koyma, ogrenme modu, 0 sayilari ve yeni oyun aynen korunur.
