import 'package:flutter/material.dart';

TextStyle header() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 19.0,
    fontFamily: 'Poppins-Bold',
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    height: 1.2,
  );
}

TextStyle title() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontFamily: 'Poppins-Bold',
    fontWeight: FontWeight.w700,
    height: 1.2,
  );
}

TextStyle body() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 15.0,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 1.2,
  );
}

TextStyle underline() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 15.0,
    fontFamily: 'Poppins-Bold',
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
    height: 1.2,
  );
}

class Documents {
  //====================PRIVACY POLICY
  RichText privacyPolicy = RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: 'Last updated: June 16, 2022\n'
              '\nThis Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.'
              '\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the TermsFeed Privacy Policy Generator.',
          style: body(),
        ),
        TextSpan(
          text: ('\n\nInterpretation and Definitions'),
          style: header(),
        ),
        TextSpan(
          text: '\n\nInterpretation',
          style: title(),
        ),
        TextSpan(
          text:
              '\nThe words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nDefinitions',
          style: title(),
        ),
        TextSpan(
          text: '\nFor the purposes of this Privacy Policy:',
          style: body(),
        ),
        TextSpan(
          text: '\nAccount ',
          style: underline(),
        ),
        TextSpan(
          text:
              'means a unique account created for You to access our Service or parts of our Service.',
          style: body(),
        ),
        TextSpan(
          text: '\nAffiliate ',
          style: underline(),
        ),
        TextSpan(
          text:
              'means an entity that controls, is controlled by or is under common control with a party, where "control" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.',
          style: body(),
        ),
        TextSpan(
          text: '\nApplication ',
          style: underline(),
        ),
        TextSpan(
          text:
              'means the software program provided by the Company downloaded by You on any electronic device, named inQui.',
          style: body(),
        ),
        TextSpan(
          text: '\nCompany ',
          style: underline(),
        ),
        TextSpan(
          text:
              '(referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to MGHS Solutions Advertising Services, City of Tarlac, Tarlac.',
          style: body(),
        ),
        TextSpan(
          text: '\nCountry ',
          style: underline(),
        ),
        TextSpan(
          text: 'refers to: Philippines.',
          style: body(),
        ),
        TextSpan(
          text: '\nDevice ',
          style: underline(),
        ),
        TextSpan(
          text:
              'means any device that can access the Service such as a computer, a cellphone or a digital tablet.',
          style: body(),
        ),
        TextSpan(
          text: '\nPersonal Data ',
          style: underline(),
        ),
        TextSpan(
          text:
              'is any information that relates to an identified or identifiable individual.',
          style: body(),
        ),
        TextSpan(
          text: '\nService ',
          style: underline(),
        ),
        TextSpan(
          text: 'refers to the Application.',
          style: body(),
        ),
        TextSpan(
          text: '\nService Provider ',
          style: underline(),
        ),
        TextSpan(
          text:
              'means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.',
          style: body(),
        ),
        TextSpan(
          text: '\nThird-party Social Media Service ',
          style: underline(),
        ),
        TextSpan(
          text:
              'refers to any website or any social network website through which a User can log in or create an account to use the Service.',
          style: body(),
        ),
        TextSpan(
          text: '\nUsage Data ',
          style: underline(),
        ),
        TextSpan(
          text:
              'refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).',
          style: body(),
        ),
        TextSpan(
          text: '\nYou ',
          style: underline(),
        ),
        TextSpan(
          text:
              'means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nCollecting and Using Your Personal Data',
          style: header(),
        ),
        TextSpan(
          text: '\n\nTypes of Data Collected',
          style: title(),
        ),
        TextSpan(
          text: '\nPersonal Data',
          style: underline(),
        ),
        TextSpan(
          text:
              '\nWhile using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:'
              '\n- Email address'
              '\n- First name and last name'
              '\n- Usage Data',
          style: body(),
        ),
        TextSpan(
          text: '\nUsage Data',
          style: underline(),
        ),
        TextSpan(
          text:
              '\nUsage Data is collected automatically when using the Service.'
              '\nUsage Data may include information such as Your Device\'s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.'
              '\nWhen You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.'
              '\nWe may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.',
          style: body(),
        ),
        TextSpan(
          text: '\nInformation from Third-Party Social Media Services',
          style: underline(),
        ),
        TextSpan(
          text:
              '\nThe Company allows You to create an account and log in to use the Service through the following Third-party Social Media Services:'
              '\n- Google'
              '\nIf You decide to register through or otherwise grant us access to a Third-Party Social Media Service, We may collect Personal data that is already associated with Your Third-Party Social Media Service\'s account, such as Your name, Your email address, Your activities or Your contact list associated with that account.'
              '\nYou may also have the option of sharing additional information with the Company through Your Third-Party Social Media Service\'s account. If You choose to provide such information and Personal Data, during registration or otherwise, You are giving the Company permission to use, share, and store it in a manner consistent with this Privacy Policy.',
          style: body(),
        ),
        TextSpan(
          text: '\nInformation Collected while Using the Application',
          style: underline(),
        ),
        TextSpan(
          text:
              '\nWhile using Our Application, in order to provide features of Our Application, We may collect, with Your prior permission:'
              '\n- Pictures and other information from your Device\'s camera and photo library'
              '\nWe use this information to provide features of Our Service, to improve and customize Our Service. The information may be uploaded to the Company\'s servers and/or a Service Provider\'s server or it may be simply stored on Your device.'
              '\nYou can enable or disable access to this information at any time, through Your Device settings.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nUse of Your Personal Data',
          style: header(),
        ),
        TextSpan(
          text:
              '\nThe Company may use Personal Data for the following purposes:',
          style: body(),
        ),
        TextSpan(
          text: '\nTo provide and maintain our Service',
          style: underline(),
        ),
        TextSpan(
          text: ', including to monitor the usage of our Service.',
          style: body(),
        ),
        TextSpan(
          text: '\nTo manage Your Account',
          style: underline(),
        ),
        TextSpan(
          text:
              ': to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.',
          style: body(),
        ),
        TextSpan(
          text: '\nFor the performance of a contract',
          style: underline(),
        ),
        TextSpan(
          text:
              ': the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.',
          style: body(),
        ),
        TextSpan(
          text: '\nTo contact You',
          style: underline(),
        ),
        TextSpan(
          text:
              ': To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application\'s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.',
          style: body(),
        ),
        TextSpan(
          text: '\nTo provide You',
          style: underline(),
        ),
        TextSpan(
          text:
              ' with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.',
          style: body(),
        ),
        TextSpan(
          text: '\nTo manage Your requests',
          style: underline(),
        ),
        TextSpan(
          text: ': To attend and manage Your requests to Us.',
          style: body(),
        ),
        TextSpan(
          text: '\nFor business transfers',
          style: underline(),
        ),
        TextSpan(
          text:
              ': We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.',
          style: body(),
        ),
        TextSpan(
          text: '\nFor other purposes',
          style: underline(),
        ),
        TextSpan(
          text:
              ': We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.',
          style: body(),
        ),
        TextSpan(
          text:
              '\n\nWe may share Your personal information in the following situations:',
          style: body(),
        ),
        TextSpan(
          text: '\nWith Service Providers',
          style: underline(),
        ),
        TextSpan(
          text:
              ': We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.',
          style: body(),
        ),
        TextSpan(
          text: '\nFor business transfers',
          style: underline(),
        ),
        TextSpan(
          text:
              ': We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.',
          style: body(),
        ),
        TextSpan(
          text: '\nWith Affiliates',
          style: underline(),
        ),
        TextSpan(
          text:
              ': We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.',
          style: body(),
        ),
        TextSpan(
          text: '\nWith business partners',
          style: underline(),
        ),
        TextSpan(
          text:
              ': We may share Your information with Our business partners to offer You certain products, services or promotions.',
          style: body(),
        ),
        TextSpan(
          text: '\nWith other users',
          style: underline(),
        ),
        TextSpan(
          text:
              ': when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside. If You interact with other users or register through a Third-Party Social Media Service, Your contacts on the Third-Party Social Media Service may see Your name, profile, pictures and description of Your activity. Similarly, other users will be able to view descriptions of Your activity, communicate with You and view Your profile.',
          style: body(),
        ),
        TextSpan(
          text: '\nWith Your consent',
          style: underline(),
        ),
        TextSpan(
          text:
              ': We may disclose Your personal information for any other purpose with Your consent.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nRetention of Your Personal Data',
          style: header(),
        ),
        TextSpan(
          text:
              '\nThe Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.'
              '\nThe Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nTransfer of Your Personal Data',
          style: header(),
        ),
        TextSpan(
          text:
              '\nYour information, including Personal Data, is processed at the Company\'s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.'
              '\nYour consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.'
              '\nThe Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nDisclosure of Your Personal Data',
          style: header(),
        ),
        TextSpan(
          text: '\n\nBusiness Transactions',
          style: title(),
        ),
        TextSpan(
          text:
              '\nIf the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nLaw enforcement',
          style: title(),
        ),
        TextSpan(
          text:
              '\nUnder certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).',
          style: body(),
        ),
        TextSpan(
          text: '\n\nOther legal requirements',
          style: title(),
        ),
        TextSpan(
          text:
              '\nThe Company may disclose Your Personal Data in the good faith belief that such action is necessary to:'
              '\n- Comply with a legal obligation'
              '\n- Protect and defend the rights or property of the Company'
              '\n- Prevent or investigate possible wrongdoing in connection with the Service'
              '\n- Protect the personal safety of Users of the Service or the public'
              '\n- Protect against legal liability',
          style: body(),
        ),
        TextSpan(
          text: '\n\nSecurity of Your Personal Data',
          style: header(),
        ),
        TextSpan(
          text:
              '\nThe security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nChildren\'s Privacy',
          style: header(),
        ),
        TextSpan(
          text:
              '\nOur Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.'
              '\nIf We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent\'s consent before We collect and use that information.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nLinks to Other Websites',
          style: header(),
        ),
        TextSpan(
          text:
              '\nOur Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party\'s site. We strongly advise You to review the Privacy Policy of every site You visit.'
              '\nWe have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nChanges to this Privacy Policy',
          style: header(),
        ),
        TextSpan(
          text:
              '\nWe may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.'
              '\nWe will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the "Last updated" date at the top of this Privacy Policy.'
              '\nYou are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nContact Us',
          style: header(),
        ),
        TextSpan(
          text:
              '\nIf you have any questions about this Privacy Policy, You can contact us:'
              '\nBy email: investorquizapp.mghs@gmail.com',
          style: body(),
        ),
      ],
    ),
  );
  //====================ABOUT US
  RichText aboutUs = RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: 'Business Overview',
          style: header(),
        ),
        TextSpan(
          text:
              '\n\nMGHS helps clients to conceptualize and plan their business. We generate feasibility studies, marketing planning, facilitate registration and licensing with concerned government agencies, perform management consulting, and coaching.'
              '\nWe specialize in facilitating the establishment of personal investment (i.e., mutual funds, retirement funds, etc.) and provide advice with the transfer of technology to the same.'
              '\nOurs is advocacy. We have something that we do very well (that is, personal finance training); we love to do it, and what we do is what the world needs, especially for OFWs and their families.'
              '\nEstablished in 2011 MGHS SERVICES is a one-stop-shop for startups, small & medium businesses. We offer a range of solutions to support, enhance, and grow your business on its stages of conceptual, ideas generation, launching your product or services, and growing your home business model to an official business store. We offer innovative solutions to launch your business in the Philippines market. We also recover from distress, leverage technology, stimulate growth, adapt to government procedures, tap into the market through marketing packages, content establishment (web), social media support, and integrate our training and workshops to complement the entrepreneurs, SMEs, and Startups.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nProducts and Services',
          style: header(),
        ),
        TextSpan(
          text: '\n\nConsultation',
          style: title(),
        ),
        TextSpan(
          text:
              '\nThe discovery phase is the first step in every business, and the purpose is to learn about the client\'s business. MGHS Services will help uncover your business\'s missions and objectives.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nFeasibility Study',
          style: title(),
        ),
        TextSpan(
          text:
              '\nOur feasibility study consulting services are designed to measure the success or failure probability of any business. MGHS Services will research the products/services of the business.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nBranding',
          style: title(),
        ),
        TextSpan(
          text:
              '\nMGHS Services offers cutting-edge branding solutions, consulting, and development. Logo design, website design and development, print design, and marketing strategy are some of branding identity and brand design services.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nFinancial Resources',
          style: title(),
        ),
        TextSpan(
          text:
              '\nFinding the best type of investor for your business is a crucial step in realizing its overall vision. MGHS Services will help you connect to the right investors.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nLocation Search',
          style: title(),
        ),
        TextSpan(
          text:
              '\nMGHS Services provides location search services for your small and medium business. We will search for you the best location for your business startup.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nHuman Resources',
          style: title(),
        ),
        TextSpan(
          text:
              '\nMGHS Services provides Human Resources Services for your small and medium business. We hire your staff you need in order to establish your business local as well as international.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nInterior Design 3D & Details',
          style: title(),
        ),
        TextSpan(
          text:
              '\nMGHS Services provides exceptional Interior Designing services to transform your office into the workplace you envision it to be.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nBusiness Construction',
          style: title(),
        ),
        TextSpan(
          text:
              '\nMGHS Services provides construction services for your business like electrical & mechanical works, etc.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nPhotography',
          style: title(),
        ),
        TextSpan(
          text:
              '\nMGHS Services assists in the capture of appealing photographs for all forms of marketing commercials and campaigns, leaving a lasting impact on your customers.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nVideography',
          style: title(),
        ),
        TextSpan(
          text:
              '\nCommercial videos produced exclusively for the web are shot and captured by MGHS Services to provide you a unique advantage in your digital advertising initiatives.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nBloggers Connection',
          style: title(),
        ),
        TextSpan(
          text:
              '\nMGHS Services connects you with bloggers for your social content promotions. We connect bloggers and brands to collaborate on blogging and influencer opportunities.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nSocial Media Marketing & Management',
          style: title(),
        ),
        TextSpan(
          text:
              '\nMGHS Services integrates your business in social media sites like Facebook, Twitter, Instagram, YouTube, etc. by advertising for your business.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nWebsite/Application Design & Development',
          style: title(),
        ),
        TextSpan(
          text:
              '\nMGHS Services provides Web & App Designing & Development Services for your small and medium business. Design your website with the latest designs. We develop your website & mobile application and provide you with content management.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nAccounting',
          style: title(),
        ),
        TextSpan(
          text:
              '\nMGHS Services provides financial accounting services for your small and medium sized business. A full-service accounting and professional services that offers the simplest way to handle accounts.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nNegotiation Brand or Franchise',
          style: title(),
        ),
        TextSpan(
          text:
              '\nMGHS Services negotiates instead of you to get your franchise or location or products prices you need.',
          style: body(),
        ),
        TextSpan(
          text: '\n\nBusiness Performance Analysis/Follow-up',
          style: title(),
        ),
        TextSpan(
          text:
              '\nMGHS Services provides performance analysis and net assessment for your small and medium sized businesses that would benefit you in your planning and decision making.',
          style: body(),
        ),
      ],
    ),
  );
  //====================TERMS OF USE
  RichText termsOfUse = RichText(
    text: TextSpan(children: [
      TextSpan(
        text: 'Last updated: June 24, 2022'
            '\n\nPlease read these terms and conditions carefully before using Our Service.',
        style: body(),
      ),
      TextSpan(
        text: '\n\nInterpretation and Definitions',
        style: header(),
      ),
      TextSpan(
        text: '\n\nInterpretation',
        style: title(),
      ),
      TextSpan(
        text:
            '\nThe words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
        style: body(),
      ),
      TextSpan(
        text: '\n\nDefinitions',
        style: title(),
      ),
      TextSpan(
        text: '\nFor the purposes of these Terms and Conditions:',
        style: body(),
      ),
      TextSpan(
        text: '\nApplication',
        style: underline(),
      ),
      TextSpan(
        text:
            ' means the software program provided by the Company downloaded by You on any electronic device, named inQui',
        style: body(),
      ),
      TextSpan(
        text: '\nApplication Store',
        style: underline(),
      ),
      TextSpan(
        text:
            ' means the digital distribution service operated and developed by Apple Inc. (Apple App Store) or Google Inc. (Google Play Store) in which the Application has been downloaded.',
        style: body(),
      ),
      TextSpan(
        text: '\nAffiliate',
        style: underline(),
      ),
      TextSpan(
        text:
            ' means an entity that controls, is controlled by or is under common control with a party, where "control" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.',
        style: body(),
      ),
      TextSpan(
        text: '\nCountry',
        style: underline(),
      ),
      TextSpan(
        text: ' refers to: Philippines',
        style: body(),
      ),
      TextSpan(
        text: '\nCompany',
        style: underline(),
      ),
      TextSpan(
        text:
            ' (referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to MGHS Solutions Advertising Services, City of Tarlac, Tarlac.',
        style: body(),
      ),
      TextSpan(
        text: '\nDevice',
        style: underline(),
      ),
      TextSpan(
        text:
            ' means any device that can access the Service such as a computer, a cellphone or a digital tablet.',
        style: body(),
      ),
      TextSpan(
        text: '\nService',
        style: underline(),
      ),
      TextSpan(
        text: ' refers to the Application.',
        style: body(),
      ),
      TextSpan(
        text: '\nTerms and Conditions',
        style: underline(),
      ),
      TextSpan(
        text:
            ' (also referred as "Terms") mean these Terms and Conditions that form the entire agreement between You and the Company regarding the use of the Service. This Terms and Conditions agreement has been created with the help of the TermsFeed Terms and Conditions Generator.',
        style: body(),
      ),
      TextSpan(
        text: '\nThird-party Social Media Service',
        style: underline(),
      ),
      TextSpan(
        text:
            ' means any services or content (including data, information, products or services) provided by a third-party that may be displayed, included or made available by the Service.',
        style: body(),
      ),
      TextSpan(
        text: '\nYou',
        style: underline(),
      ),
      TextSpan(
        text:
            ' means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.',
        style: body(),
      ),
      //========================================================
      TextSpan(
        text: '\n\nAcknowledgment',
        style: header(),
      ),
      TextSpan(
        text:
            '\nThese are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.'
            '\nYour access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.'
            '\nBy accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.'
            '\nYou represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.'
            '\nYour access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.',
        style: body(),
      ),
      TextSpan(
        text: '\n\nLinks to Other Websites',
        style: header(),
      ),
      TextSpan(
        text:
            '\nOur Service may contain links to third-party web sites or services that are not owned or controlled by the Company.'
            '\nThe Company has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods or services available on or through any such web sites or services.'
            '\nWe strongly advise You to read the terms and conditions and privacy policies of any third-party web sites or services that You visit.',
        style: body(),
      ),
      TextSpan(
        text: '\n\nTermination',
        style: header(),
      ),
      TextSpan(
        text:
            '\nWe may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.'
            '\nUpon termination, Your right to use the Service will cease immediately.',
        style: body(),
      ),
      TextSpan(
        text: '\n\nLimitation of Liability',
        style: header(),
      ),
      TextSpan(
        text:
            '\nNotwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven\'t purchased anything through the Service.'
            '\nTo the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.'
            '\nSome states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party\'s liability will be limited to the greatest extent permitted by law.',
        style: body(),
      ),
      TextSpan(
        text: '\n\n"AS IS" and "AS AVAILABLE" Disclaimer',
        style: header(),
      ),
      TextSpan(
        text:
            '\nThe Service is provided to You "AS IS" and "AS AVAILABLE" and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, the Company, on its own behalf and on behalf of its Affiliates and its and their respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory or otherwise, with respect to the Service, including all implied warranties of merchantability, fitness for a particular purpose, title and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage or trade practice. Without limitation to the foregoing, the Company provides no warranty or undertaking, and makes no representation of any kind that the Service will meet Your requirements, achieve any intended results, be compatible or work with any other software, applications, systems or services, operate without interruption, meet any performance or reliability standards or be error free or that any errors or defects can or will be corrected.'
            '\nWithout limiting the foregoing, neither the Company nor any of the company\'s provider makes any representation or warranty of any kind, express or implied: (i) as to the operation or availability of the Service, or the information, content, and materials or products included thereon; (ii) that the Service will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content provided through the Service; or (iv) that the Service, its servers, the content, or e-mails sent from or on behalf of the Company are free of viruses, scripts, trojan horses, worms, malware, timebombs or other harmful components.'
            '\nSome jurisdictions do not allow the exclusion of certain types of warranties or limitations on applicable statutory rights of a consumer, so some or all of the above exclusions and limitations may not apply to You. But in such a case the exclusions and limitations set forth in this section shall be applied to the greatest extent enforceable under applicable law.',
        style: body(),
      ),
      TextSpan(
        text: '\n\nGoverning Law',
        style: header(),
      ),
      TextSpan(
        text:
            '\nThe laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the Service. Your use of the Application may also be subject to other local, state, national, or international laws.',
        style: body(),
      ),
      TextSpan(
        text: '\n\nDisputes Resolution',
        style: header(),
      ),
      TextSpan(
        text:
            '\nIf You have any concern or dispute about the Service, You agree to first try to resolve the dispute informally by contacting the Company.',
        style: body(),
      ),
      TextSpan(
        text: '\n\nFor European Union (EU) Users',
        style: header(),
      ),
      TextSpan(
        text:
            '\nIf You are a European Union consumer, you will benefit from any mandatory provisions of the law of the country in which you are resident in.',
        style: body(),
      ),
      TextSpan(
        text: '\n\nUnited States Legal Compliance',
        style: header(),
      ),
      TextSpan(
        text:
            '\nYou represent and warrant that (i) You are not located in a country that is subject to the United States government embargo, or that has been designated by the United States government as a "terrorist supporting" country, and (ii) You are not listed on any United States government list of prohibited or restricted parties.',
        style: body(),
      ),
      TextSpan(
        text: '\n\nSeverability and Waiver',
        style: header(),
      ),
      TextSpan(
        text: '\n\nSeverability',
        style: title(),
      ),
      TextSpan(
        text:
            '\nIf any provision of these Terms is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect.',
        style: body(),
      ),
      TextSpan(
        text: '\nWaiver',
        style: title(),
      ),
      TextSpan(
        text:
            '\nExcept as provided herein, the failure to exercise a right or to require performance of an obligation under these Terms shall not effect a party\'s ability to exercise such right or require such performance at any time thereafter nor shall the waiver of a breach constitute a waiver of any subsequent breach.',
        style: body(),
      ),
      TextSpan(
        text: '\n\nTranslation Interpretation',
        style: header(),
      ),
      TextSpan(
        text:
            '\nThese Terms and Conditions may have been translated if We have made them available to You on our Service. You agree that the original English text shall prevail in the case of a dispute.',
        style: body(),
      ),
      TextSpan(
        text: '\n\nChanges to These Terms and Conditions',
        style: header(),
      ),
      TextSpan(
        text:
            '\nWe reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to provide at least 30 days\' notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion.'
            '\nBy continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the website and the Service.',
        style: body(),
      ),
      TextSpan(
        text: '\n\nContact Us',
        style: header(),
      ),
      TextSpan(
        text:
            '\nIf you have any questions about these Terms and Conditions, You can contact us:'
            '\nBy email: investorquizapp.mghs@gmail.com',
        style: body(),
      ),
    ]),
  );
}
