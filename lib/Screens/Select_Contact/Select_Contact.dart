// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Constants.dart';
import 'package:whatsapp/Models/Chat_Model.dart';
import 'package:whatsapp/Screens/Chat_Screen/Chat_Screen.dart';
import 'package:whatsapp/Screens/Contacts_Help_Screen/Contacts_Help_Screen.dart';
import 'package:whatsapp/Screens/Create_Group/Create_Group.dart';
import 'package:whatsapp/Widgets/Contact_Card.dart';

class SelectContact extends StatefulWidget {
  SelectContact({
    Key? key,
    // required this.sourceChat,
    // required this.chatModels,
  }) : super(key: key);

  // final ChatModel sourceChat;
  // final List<ChatModel> chatModels;

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  final TextEditingController _hi = TextEditingController();
  Widget appBarTitle = Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Select Contact",
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
      Text(
        "256 contacts",
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    ],
  );
  Icon actionIcon = Icon(
    Icons.search,
    size: 26,
  );

  var query;
  late bool _IsSearching;
  String _searchText = "";

  _SelectContactState() {
    _hi.addListener(() {
      _hi.value = query;
      if (_hi.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _hi.text;
        });
      }
    });
  }

  static get index => null;

  @override
  void initState() {
    super.initState();
    _foundUsers = _allUsers;
    _IsSearching = false;
  }

  List<Map<String, dynamic>> _foundUsers = [];

  // List<ChatModel> contacts = [
  //   {"name": "Bobby Arora", status: "About...."),
  //   {"name": "Sonia Arora", status: "About...."),
  //   {"name": "Tripta Arora", status: "About...."),
  //   {"name": "Bunty Arora", status: "About...."),
  //   {"name": "Vijay Arora", status: "About...."),
  //   {"name": "Pushpa Arora", status: "About...."),
  //   {"name": "JC Arora", status: "About...."),
  //   {"name": "Vidhi Arora", status: "About...."),
  //   {"name": "Siddhu Arora", status: "About...."),
  //   {"name": "Nisha Arora", status: "About...."),
  //   {"name": "Raghu Arora", status: "About...."),
  // ];

  final List<Map<String, dynamic>> _allUsers = [
    {
      "name": "Madhav Arora",
      "message": "Hey Flutter, You are so amazing !",
      "time": "15:30",
      "avatarUrl":
          "https://avatars.githubusercontent.com/u/72864817?s=400&u=2f8a4bd2f1f03f4f6ad73c61abfc5770afd1e135&v=4",
      "about": "I overthink therefore I overam",
      "phoneno": '9999348666',
      "id": 1,
    },
    {
      "name": "Raghav Arora",
      "message": "Hey I have hacked WhatsApp India!",
      "time": "5:00",
      "avatarUrl": "https://avatars.githubusercontent.com/u/66276244?v=4",
      "about": "Be Kind 🤗😇",
      "phoneno": '7011698878',
      "id": 2,
    },
    {
      "name": "Harry",
      "message": "I'm good!",
      "time": "10:30",
      "avatarUrl":
          "https://upload.wikimedia.org/wikipedia/commons/a/a0/Pierre-Person.jpg",
      "about": "Online",
      "phoneno": '0000000000',
      "id": 3,
    },
    {
      "name": "Edward",
      "message": "I'm the fastest man alive!",
      "time": "12:30",
      "avatarUrl":
          "https://ebizfiling.com/wp-content/uploads/2017/12/images_20-3.jpg",
      "about": "Hey there! I am using WhatsApp India.",
      "phoneno": '0000000000',
      "id": 4,
    },
    {
      "name": "David",
      "message": "Hey Flutter, You are so cool !",
      "time": "15:30",
      "avatarUrl":
          "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYWFRgVFhYYGBgaGhgcGBoYFRgYGBgYGBgZGRgYGBgcIS4lHB4rHxgYJjgmKy8xNTU1GiQ7QDszPy40NTEBDAwMEA8QHxISGjQhISExNDQ0NDE0NDQ0MTE0NDQ0NDQ0NDQ0NDQxNDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NP/AABEIALcBEwMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAADAAIEBQYBBwj/xAA9EAACAQIEAwYEAgkDBQEAAAABAgADEQQSITEFQVEGImFxgZETMqGxB8EUI0JScoKy0fCiwuEVJDNikoP/xAAYAQADAQEAAAAAAAAAAAAAAAAAAQIDBP/EACIRAQEAAgIBBQEBAQAAAAAAAAABAhEhMRIDEyJBUTJhQv/aAAwDAQACEQMRAD8A8ndLBT1BI9zLLh18g6XMgVflT+D8zJ/DmOS33mWXTWJ6+e8elO1jy5xqpz5wgc5dpDQVKY5ecHjsLmFxoy6ico1r7eVukK57um8Wh9FhbVV10cSThq2uRtxIlamUIdOW46yVYOuYaN9oBYsBI4XvZraRmHxFrK4sdpMdRaKcKvJIwzp/GsL2sH69P4f7yJTezoDycfeTO0lQNWS3JfzmmPVZZ/1HEpXhsBxD4ZdSuh5+Q1naJEDjaFxcf5pI3qruO4MGtlPUj+82HY/F5XKHZhmHnsfymNdbIvhb7S14XiSjo99iL+RFj94sbq7PKbxsepxRtB8ygx86nK5FOxQDkUUUA5EZ2ccwDMdra/dVOp19Jjqol92grZqp6DSUdaYZXeTXGcKfitXIjEb2M84rsWYk73N/ebjirl3yD/On5mY3iKZHIG0cFa7CL3F8pnOO4zO+RT3V38TLLHY4JQQD5mFhM4otvudTHJ9lSMYY5jBO9pUI12tAzu85aVOC7ctFHWijGk9zcL4Lb2llgGugvKyi5Km+8scCO4OcyyXinI9gYZT/AMwYMep1mbRn8XimSsxU89RLnh2PVxvY+MznEv8AyN5wCOQbg2m3juMZlZXoFO+nSR2pFGzrtzEzWHxzsQociS2zK+QuSSBe2wv+cz8bK1uUsaGvj6JW7OA3IC5b2Gto3DcVQ6NmA5EqQPU/3kPB4BAASL3+81OBwlEpb4ai410Osn4xcxyvKvJUlGBG4O42hccQ7hxyAEicQ4IhyhCyNfUXNiOo6GT/AND+GoQG+g1lS/HhGWPy5CxVwUsd/wC8snS4AlVWfvIPH85JwtaznMfKRVbTMZTsBbl/aKi2tv8ANoWtUvYdZYfo6fDzXFxf7aR+N+x5Rr+zPFEekqlhmXQ9bjSXD4pRznk3DMSVq93nvNT+kP1lT1dcVnfS54a79NTrGnHp1mT+M3WMNVusPen4Xs39bSliFbYwmYdZiExDjZiIji3/AH294/en4Pav62+cdZGxmICoTfYGY44l/wB9vcyNXrOxylmI8zD3t/QvpWfYeIfMxbqbyp4pXCIzS0rTMcVf4lQINhvJUh8PpEgu25vMvxmn3z5zdhABYcpjeML3ztvHKVU1RmZgCdtB4QFZipI6Q5HfHmILHjvtNJ2mwA1TG7zkQlJOAnbRyiK0Wz0ZaKPtFDY0l0B3W9ZZcPF1AlYmzSzwPyA2meS8U1FsdYUkTiMDzi+Bcb9ZC2axyXdiOshMLS1rUrMQOUg110m8YUzD0ixknOQ5ubnQfQCO4ftJeJw7DvGxsLgm1zqNBbpcScryvHHc2nrjcijKAf4gSPYakx+H7RYhWCqAVPLIR94zhuPVLBluDy5SyxGPQWZKWgIzAXLkf+t9hMuuNN5N87P4z2gqI6oyKNFa5a2jbEN/m0n0eI/EVSdCVF79dj5yrq8ap1QqPRfuX1Ond0uDf10kt6SMoaloq6AdAOUJxxospzve1tQwqtYkQvFsOmRcu9xI/CsWCMraGGxqk2A6xb1U2bh+Eu4t0AiZCpIBNj4x+DbKslvYgMN9IrlbeVTGScK/DHJU1Evf+pr0mcxtfvZul4qOPDGwjuG+Ycy/WiPEx0nDxHwlK+Iym1pxsQb6D6SfAbi6PEfCCbiJ6SofEte1o0Yhr2t9I/E/KLduJ+ENhXL94ypK3tLqimVQISROaLxKvkQn2lHwykdXO7faO45ig9VKV/OScRVWmlzsBLZqftBxEU0IHzGYoOxNySST1kriWLNVy5Ol9P7yN0lSaSa4748xI/EFOdoevfOPMRnEj3z5CVj2d6QDHoJwgxyS6zk5OAiEeohAknagbRQ2WKGwenytLHB/KPHS0rraGWWEHcGsi9KxSUWx+0lKSD1kene4hiSqsd7SauKTE/O3nImIbuyUWLXPWRcSuk2jCi8N+X1lpjKTCirrsWs1/e48dPrKzh/y+vhL2qhbDHopUnoLsB+czy7aY9KZWBHjylrgwjEOVL7ZkLMFNuYAIlA6spj8PjnQ6exhZvpUuu2nx3wKirkpmi6m7Fc+qhTcHMSN9YfgROvSwIHnrKzB8Qet3CAFt3jzI2IEueFN33HtFZdcnuXLhMOFJGddDD4bE5iFO8fhKmhEVfC3IddxM9/StLbD4cWIPSMUalRteMweIzix3kmlTsTJOIeIwQZrbbynohVrFN7Sy4y7KpINt5m+D181a5NzNsb8azynyjR4ldfWSMML7w7IDOCmOUmZaaXDaJUFm943LrJjIIzKBDyL2/8AT8JTu8nY2rkUn2iwCaZpX8TfO4QesInLtm61A/HSoef2kPtVxHMfhqdOflLPtO+VVy7iYLE4hgxJ1JlYxFFZRIzPcgDa4gzXLaQiLt5y+k9j17Zx6QfEF73oITF/MPSc4iBn9BFFVXsYSgJx7QmGMu9J+xVSI6QhN9oikgwrxQlooAWrhXXQjrJmFAygQDY9stiDe/STMKbreTd6PHWxlIGxna57jHwjrCBxYsp8oouqhG0gcQ2kKm0G9MHc+0305xuHVVVCWnofYHApicJWDi4Z8jC+oVVVkynkQTmv1nmbLpYbTf8A4V8ep0fi0KrKit+sR2IAuAFZfE2ykAeMcxm9n5XSp7Rdm6mGbvDOhPcqAaH/ANWH7LeHPleUaU1J1E9T7TdslCMtLCPXQghmqDJTI65Pmb1CzzSnxGkTmyOBrmRWFvBVZrlR4kMfORlhZ00xzl/pednuH3p4msUJSlQdr7d8WZQD1sG9I3hWLTO12ALai5tfy6y24P2tR8HXwz0Foo9KstF0DZGYo9kctqXNvn5nSwnn6G4sY/D46T5/LceiUagVCY/A45XGh9JhcPj6iaBjbpuD6GHpY8qcy6HcjkfLpM76VX7jerT74YadZbU2vMjhOItUQMNDNJwutm08pjZY0mQPFVB7p53mcp8PFPEDLzl52grZGBHK8z2D4j8SuPCaycMv+mqrYhU0JgnxqDS+8qO0N8y+ayFivmT+KZyN7lqtGcct7RhxqE5ecpHezpp1jQ9qg05H7ytF5Vug4SnfwmZo4mzu7ba2llj8T3FTrvMd2nxlu4h0trHJtnVbxTiLVHJv3eUp8cuxjErEsBJGMXQf5yl9VHcQaK6yUqwNBNZPCR5USOYs94eQguIL3gfARuOvm9osY2o8hJk6VUJobDLBtC4Yy70hMTSNd49TpOKg3IkRRukUJ8XwEUfISlfkfqIcVCD4coTDkEG4B9Iu6w22k2nIVNwRY8pUV+Il720XpzPmZZuwUNfkCfpMwptKwkTnamCpFeRi86TNmYr6mGwVf4dRKlr5HVrdQrAkeouPWRidL9I+AfRqYFGQFQCrKCD1VhcfSeOdvuCrhsQMugqhmItoCCBf1vPTvw8x/wAXAUSd0Bpn/wDM5V/0ZT6zEfi2P+5onl8Nh7ML/cSr0TX9lqVLHcMRSisyUzSOZQSHRcobXmRla/jPE8hGh3Gh8xoZ6r+DOK7uJpX2ZHF7ftqyH+hfeed8fw+TE4hLWy1qo9C7FfoREEIOLawbPOXjIja3s3UzUD1Vip9gw+/0miwrkOCJj+yeI0qIequP6W/2za06Y0M5fU4ydGHOKNxR87gHxj8LwdEIcbyNjKgFQHzllRxStZQdYt3S8ZN0+vhlfcQT4JTy2kjEOE+bSBXFp1i5XwY2DUm9to1sKt721hP0tOsG+KTrAcI3Hq4Sne/etPP3xBdmvuZe9p8QS6gG4mdC98zTHpz5dg0ls/rJ2KGgkdV70PiG0Eq9lAsIvek9UkLCHvSeZNOIWOWzbwWN3HkI/HN3oPFHbyjgqMzeEJhlgiYXDy/pCSgjr2nFnUSQpzKIo/4RihstLBG3108o97ECzQKLyOxhDSAsLfWJSPxEkUz42BPgTYygIl1xYkIP4hf2J/KUhM1w6Z59ukwqnSBMIh0lJEQxy9INZ3NGHq/4OYu6Yiif2WR1/nBRv6F94z8W8PpRe2zMt/4hf/bKD8Lcb8PHKhNhVR0/mADr/SR6zXfisl8MDqbOupPU20A84/omZ/CjFhMcUO1Sk67X7ylXH0V5Xdv6ITH17bMUf/6Rb/UGRex2JFPHYZybD4iqbdHun++Wn4mD/viRzppzvsXinRsg0GDCThAgEzs89q6f+2ZfcEj6gT0JH2nmGErZHVx+ywPoDr9J6GMSNCNb7WF9Jz+rOZW3p3g9sIKrNrtKjBuUrgXvYy74RRcubqQplwvZ2nnzka+U5vT876l/JrS8rNRScdr5yOVpW0VFt/rNrX4AjyO/AkXedOUtmk7m9soFFj/eDKi3/M1R4XSEFV4QltJl402B4uveWQEplnNpfcfwVmFjpKvhptUMq5XHG2fSdcoaUyGIO85VGklVv/I0i1Gl43eMpa5Nwg70scukq8N80s76QpxBxu8HiG0XTlH47f0nMSui+UcKoRELh4xo6i2stKWoESA9ZPo4IZA19xIZSxPhMp6ktsi7A7HrFCWE5K2WlhSW5F5x9DodLyDhMbmOU6HlJ5AGt4rLDnPSt4vW+VeWp9dh+crB1kriD5nPQWAkQ6ma4zUZZXdchkEE3SPUyknmcYTqxXjNO4NjTSrUqoNijox8lYZvcX9567+IdFmwjkjYA+gIN54mp1tyM9WenUrcLFT9IqPmpHMpIK3QFWUk8rqY4VebUKpRlcbowYeakMPqJoe3mNFXEhwtgU08db3+szQGmu3rL/tPUZ6eGqMRrSRbBbWbIA1zz1UxQ2evGM8RMZeIOpPVOwdNKuGVmF2Rijfy2K/6Ss8qWeh/hhjQBWonc5ai+Itkb2svvJym4eN09BXDqBoBOGnBO5kiiL7xSHa4qG87jHQJqdZJUCVHFuHu5up0lFtl8dibPodIfD4wOLXk1uz7Hc/SVOLw/wAFsok2KlROKUgbyoREU35y7yFtTIGJwvO0zzw3LP1crO1EOdm5SM00TUgwy7SqxvDnQ6a3hJqSFe1dQ+aWgXSQaeHcNcqZJjoiLjjY+kDWY2XXlC406wdY6LHBQDrHUxrBvFSMpLTYc/q18pVVj3jLPDH9WvlKrEHvGcnpT51pejM4inLTs6UG4ejZ5as4Ilc5s3jaPsQL+F/aK8njxFXVNyT1J+85t5xt50eM2ZGGOUxpMcsCFUzrCMWPvGbjC4npHYnHh+HYig170y5AH7rrcX/mDzzia/8ADuoc2JTKWzUxpcDZiB/UYTsqzCsLa9Ja4ti+DpMSTkZ1HQDO23/1KqqtmIPIkW8tJdYJs2CqL+67W/mVT97wgUDRhEeYwiIyptLvsviWp4qnUB7ubK2u6v3dfUg+kz6reGVCNr35G9oB7gManOS6PE02vMnw3FM9JHIF2UE+fP6wrq1w2gtJ0dbqjUB1AhXaY9OPVEAFgRJ1DtFmGqmMlxUS/hMv2iwtmDXli/H16Sp4zihVAAgc7VWYWteNNK+5jBQYHQXnKhccpKtgYigBBU8QB3WHrFXdzyldiHbpC4jyXHcOmhkPFYAHVZBweOy6NzllSxQJsDeZ2WLllZbH0yGtA1NQsmcZPfMhudBKiaE7DpG04mnU3lE0OEP6tfKVmIPflhhD+rErcSe9OX0/7q7058M9IpzPFOjlImJqDPcR7PdWHPKY0U9cw1tv5QGKvY220BMNb4LfCFfpacIM6s6QZqzdo0S17fsgk+QgxLrCVVGHcWFyGBPMnl9xKUSZd7/w7NHiEBjFEcsoHTWfh8D8Sta+tMDS/Nv+JkxNx+Gqm+JIIXu0xci9rlzoPSOdlWSxyFajqdxUcf6jLDgdYBK6EZiVQqPEZgT9V9pC4qLVqnezd86nc3N7/WSOzlMvWKL+0jD2IN4fYVbaXHScbaTOLUAlRkU3A5+POQrwph0+kOpI0F/O1wJGO8l0m0iDd9nahfDoTut0027ugPtaW/wtOczvYzFdx03s+YeAYa/VT7zTfpVuUDQKzMD8pjUxB2tLdMQrcoOrSS9wRAK9vWJKbE7G0nIg849ViCOxAFtpV4zEC+hvLfEoCJQ4nDvfSMBmqTykSsjHwj2WoNo2riiBqIggVsGTzg6AKG97wxxV4F1JisOaTBUR9SusqOIUznsqm3KGF1NxLOm4YXG/OZ2aVvbNGg/7pg/hkHUTS1n0jXRWG0PIaR8I3cEr8R8xlki2Ww2lXiG70y9P+qq9G3igs0U30hPw9M3vqo6kHbxEfiDTFJ1BuxsdrbEGWK1ja1z9IBsChv4w2XDPLHwd7aHlHBh/mk0QOaoFIr+0X/0gA/e0hzrxCKTRuq0NeBjlMYOLTddgsNT+DUqVGKHPYEdAo/MmYVRJuE4vUpDKjWF9ioZfHQxy6IbjrJ8d8hzLfQnnoL/W8ZwfEZK6MCf2hobaMjA6+siVsQzsXa1z0AA9AI1apUhlNiNQeh6w3yafxZTmudCdl6Dqel5WvOVK7MSSSSTc3JOsKgBhQ7Vw/wCrVxrqVYdDup9R9oOi07VaxI5EC/pOU6dtYg0vZJxnqDbuqfYm/wBxNWpvzEwPD8aaTZgAQRYg7230PXSa2lnIBAIBAO3IwoXFJxtmEJ+jK25v5SjckHn7TgxDA7m0RtLSTKO6IqzG20pf+otbcxpxx6wCez33BEh4gHYCcbFMdhAYis1rkQIGqZDq2nK1fxtItRXIuNobMHEgDWCpVus4UN9dY9kHS0m0Q5heBDlDcRPXI2EGSWHMQPYtfFgr49Jw4kaeMhVMKTzPtFh6Y5gg+POTobWCnuyFkBLSSTYSCatmMywnyq7eDfhTsXxT4xTblC3V48PFFAKDiCWqN4m/uLn63gF1iilzpDpSMKxRRggseizkUDFOgkcxRQBynlOtFFAg7SRh25RRQAlgQbzo+UDwiijNY8VwqIt0LX53Nxb1np2HQZFHRR9AIopjLuL9SapzovQe0A1Feg9oopTM00l5qIN8Ov7oiigaOyDaRaqDnrFFEcQqlJf3RBVEU8ooojBeipjP0NepiigHaeHVeV/OddR0HtFFGA2AgKtMEWiigSIWy91hfpCLTQ/s2iik0y/RRFFFGH//2Q==",
      "about": "Busy",
      "phoneno": '0000000000',
      "id": 5,
    },
    {
      "name": "Bill Gates",
      "message": "On the way !!",
      "time": "15:30",
      "avatarUrl":
          "https://pbs.twimg.com/profile_images/1414439092373254147/JdS8yLGI_400x400.jpg",
      "about": "Available",
      "phoneno": '0000000000',
      "id": 6,
    },
    {
      "name": "Alexandra",
      "message": "Way to Delhi 🤘🏻✌🏻",
      "time": "17:30",
      "avatarUrl":
          "data:image/jpeg;base64,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",
      "about": "✨😁",
      "phoneno": '0000000000',
      "id": 7,
    },
    {
      "name": "John",
      "message": "Congo 👍🏻👏🏻",
      "time": "5:00",
      "avatarUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5cqFuNuQc-evg5bzAK6Ro5ObXPyuPf4EgYQ&usqp=CAU",
      "about": "Can't talk, WhatsApp India only",
      "phoneno": '0000000000',
      "id": 8,
    },
    {
      "name": "Amy",
      "message": "I'm good!",
      "time": "10:30",
      "avatarUrl":
          "https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/04/GettyImages-688402807_header-1024x575.jpg?w=1155&h=1528",
      "about": "Busy",
      "phoneno": '0000000000',
      "id": 9,
    },
    {
      "name": "Joe",
      "message": "Any query??",
      "time": "10:30",
      "avatarUrl":
          "https://www.mnp.ca/-/media/foundation/integrations/personnel/2020/12/16/13/57/personnel-image-4483.jpg?h=800&w=600&hash=9D5E5FCBEE00EB562DCD8AC8FDA8433D",
      "about":
          "Problem is a part of life and facing with strength is art of life 😎🤩",
      "phoneno": '0000000000',
      "id": 10,
    },
    {
      "name": "Adam",
      "message": "Congratulations 👏🏻👏🏻🎉🎊",
      "time": "12:30",
      "avatarUrl":
          "https://4bgowik9viu406fbr2hsu10z-wpengine.netdna-ssl.com/wp-content/uploads/2020/03/Portrait_5-1.jpg",
      "about": "Life is like a riding Bicycle. 🤗🚲",
      "phoneno": '0000000000',
      "id": 11,
    },
    {
      "name": "Austin",
      "message": "What happened??",
      "time": "15:30",
      "avatarUrl":
          "https://www.jamsadr.com/images/neutrals/person-donald-900x1080.jpg",
      "about": "Available",
      "phoneno": '0000000000',
      "id": 12,
    },
    {
      "name": "James",
      "message": "Anything else?",
      "time": "12:30",
      "avatarUrl":
          "https://www.masterclass.com/course-images/attachments/gruGUMnA9U4Mxy1yEuBKHeuv?width=400&height=400&fit=cover&dpr=2",
      "about": "Busy",
      "phoneno": '0000000000',
      "id": 13,
    },
    {
      "name": "Jack",
      "message": "Happy Journey ✨✨",
      "time": "15:30",
      "avatarUrl":
          "https://upload.wikimedia.org/wikipedia/commons/2/23/Photo_portrait_PP.jpg",
      "about": "This shall pass too 😚🤗",
      "phoneno": '0000000000',
      "id": 14,
    },
  ];

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  // final suggestion = _hi.text.isEmpty
  //     ? ContactCard(
  //         contact: contacts[index - 2],
  //       )
  //     : ContactCard(
  //         contact: contacts[index - 2].where(
  //           (p) => p.startsWith(
  //             query.toList(),
  //           ),
  //         ),
  //       );
  @override
  Widget build(BuildContext context) {
    // var listToShow;
    // if (_hi.isNotEmpty)
    //   listToShow =
    //       data.where((e) => e.contains(query) && e.startsWith(query)).toList();
    // else {
    //   listToShow = data;
    // }

    return
        // Scaffold(
        //   appBar: AppBar(
        //     title: appBarTitle,
        //     actions: [
        //       IconButton(
        //         icon: actionIcon,
        //         onPressed: () {
        //           setState(() {
        //             if (actionIcon.icon == Icons.search) {
        //               _handleSearchStart();
        //               actionIcon = Icon(Icons.close);
        //               appBarTitle = TextField(
        //                 style: TextStyle(
        //                   color: white,
        //                 ),
        //                 autofocus: true,
        //                 controller: _hi,
        //                 decoration: InputDecoration(
        //                   prefixIcon: Icon(
        //                     Icons.search,
        //                     size: 26,
        //                     color: white,
        //                   ),
        //                   hintText: "Search...",
        //                   hintStyle: TextStyle(
        //                     color: white,
        //                   ),
        //                 ),
        //               );
        //             } else {
        //               _handleSearchEnd();
        //               actionIcon = Icon(
        //                 Icons.search,
        //                 size: 26,
        //               );
        //               appBarTitle = Column(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     "Select Contact",
        //                     style: TextStyle(
        //                       fontSize: 19,
        //                       fontWeight: FontWeight.bold,
        //                       letterSpacing: 1,
        //                     ),
        //                   ),
        //                   Text(
        //                     "256 contacts",
        //                     style: TextStyle(
        //                       fontSize: 13,
        //                     ),
        //                   ),
        //                 ],
        //               );
        //             }
        //           });
        //         },
        //       ),
        //       Theme(
        //         data: Theme.of(context).copyWith(
        //           dividerColor: black,
        //           iconTheme: IconThemeData(
        //             color: white,
        //           ),
        //           textTheme: TextTheme().apply(),
        //         ),
        //         child: PopupMenuButton<int>(
        //           onSelected: (item) => onSelected(context, item),
        //           itemBuilder: (context) => [
        //             PopupMenuItem<int>(
        //               value: 0,
        //               child: Row(
        //                 children: [
        //                   Text(
        //                     'Invite a friend',
        //                     style: TextStyle(
        //                       fontSize: 14,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             PopupMenuItem<int>(
        //               value: 1,
        //               child: Row(
        //                 children: [
        //                   Text(
        //                     'Contacts',
        //                     style: TextStyle(
        //                       fontSize: 14,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             PopupMenuItem<int>(
        //               value: 2,
        //               child: Row(
        //                 children: [
        //                   Text(
        //                     'Refresh',
        //                     style: TextStyle(
        //                       fontSize: 14,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             PopupMenuItem<int>(
        //               value: 3,
        //               child: Row(
        //                 children: [
        //                   Text(
        //                     'Help',
        //                     style: TextStyle(
        //                       fontSize: 14,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        //   body: ListView.builder(
        //     itemCount: _allUsers.length + 2,
        //     itemBuilder: (context, index) {
        //       if (index == 0) {
        //         return InkWell(
        //           onTap: () {
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (builder) => CreateGroup(),
        //               ),
        //             );
        //           },
        //           child: Column(
        //             children: [
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               ListTile(
        //                 leading: CircleAvatar(
        //                   radius: 23,
        //                   backgroundColor: one,
        //                   child: Icon(
        //                     Icons.person_add,
        //                     color: white,
        //                   ),
        //                 ),
        //                 title: Text('New group'),
        //               ),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //             ],
        //           ),
        //         );
        //       } else if (index == 1) {
        //         return ListTile(
        //           leading: CircleAvatar(
        //             radius: 23,
        //             backgroundColor: one,
        //             child: Icon(
        //               Icons.person_add,
        //               color: white,
        //             ),
        //           ),
        //           title: Text('New contact'),
        //           trailing: IconButton(
        //             onPressed: () {},
        //             icon: Icon(
        //               Icons.qr_code,
        //               color: grey,
        //             ),
        //           ),
        //         );
        //       }
        //       return GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (builder) => ChatScreen(
        //                 avatar:
        //                     "https://avatars.githubusercontent.com/u/72864817?s=400&u=2f8a4bd2f1f03f4f6ad73c61abfc5770afd1e135&v=4",
        //                 name: 'Madhav Arora',
        //                 phoneno: '9999348666',
        //                 about: 'I overthink therefore I overam',
        //                 // sourceChat: widget.sourceChat,
        //                 // chatModels: widget.chatModels,
        //               ),
        //             ),
        //           );
        //         },
        //         child: ContactCard(
        //           contact: !_IsSearching
        //               ? _allUsers[index - 2]
        //               : _allUsers[index - 2].where(
        //                   (p) => p.startsWith(
        //                     query.toList(),
        //                   ),
        //                 ),
        //         ),
        //       );
        //     },
        //   ),
        // );
        Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: transparent,
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Image.network(
                            _foundUsers[index]["avatarUrl"].toString(),
                          ),
                          title: Text(_foundUsers[index]['name']),
                          subtitle: Text(
                              '${_foundUsers[index]["age"].toString()} years old'),
                        ),
                      ),
                    )
                  : Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => CreateGroup(),
        //   ),
        // );
        break;
      case 1:
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => NewBroadcast(),
        //   ),
        // );
        break;
      case 2:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Your contact list has been updated."),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContactsHelpScreen(),
          ),
        );
        break;
    }
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      _IsSearching = false;
    });
  }
}
