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
}
