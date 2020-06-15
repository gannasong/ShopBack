# ShopBack

<p align="center">
    <a href="http://cocoadocs.org/docsets/Cards">
        <img src="https://app.bitrise.io/app/06b4d3f9fd381df6/status.svg?token=xn8UMq77aOXmEUZatQ1urQ"
            alt="Bitrise"></a>
    <a href="http://cocoadocs.org/docsets/Cards">
        <img src="https://img.shields.io/badge/Swift-5-orange.svg?style=flat"
            alt="Swift"></a>
    <a href="http://cocoadocs.org/docsets/Cards">
        <img src="https://img.shields.io/cocoapods/p/Cards.svg?style=flat"
            alt="Platform"></a>
    <a href="https://github.com/PaoloCuscela/Cards/blob/master/LICENSE">
        <img src="https://img.shields.io/github/license/PaoloCuscela/Cards.svg"
            alt="License"></a>
</p>

## Screenshots

<p align= "center">
<img alt="01" src="screenshots/homepage.png" width="280">&nbsp;
</p>

## Technologies

#### Charles
Use [Charles](https://www.charlesproxy.com) capture api data source 🕶

API Categories | Base url | Path | Method
---------------|----------|------| ------
checkUniqueAccount | https://api-app.shopback.com.tw/ | members/check-unique | Get
signInWithEmail | https://api-app.shopback.com.tw/ | members/sign-in | Post
fetchMemberData | https://api-app.shopback.com.tw/ | members/me | Get
fetchHomepageTrip | https://api-app.shopback.com.tw/ | mobile-content/v1/components/5d6aa42df1f1ce3e49650aff | Get
fetchHomepageBanner | https://api-app.shopback.com.tw/ | mobile/banners | Get
fetchHomepageArticle | https://api-app.shopback.com.tw/ | mobile/wordpress-posts | Get
fetchHomepageProduct | https://api-app.shopback.com.tw/ | mobile-content/v1/components/5dd3b7a0dbaead21d7b0e17d | Get
fetchCashbackAmounts | https://api-app.shopback.com.tw/ | cashbacks/latest | Get

#### Reactive
- [X] RxSwift
- [X] RxCocoa

#### Network
- [X] Moya/RxSwift

#### Image
- [X] RxNuke

#### Layout
- [X] IGListKit

#### CI/CD
- [X] Bitrise
- [X] Fastlane
- [X] Slack

## Building

The following commands will set up ShopBack
```sh
cd ShopBack
pod install
```

## License
MIT License. See [LICENSE](https://github.com/gannasong/RxSwift-MVVM-Demo/blob/master/LICENSE).
