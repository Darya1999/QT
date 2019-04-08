#ifndef WEBAPPCONTROLLER_H
#define WEBAPPCONTROLLER_H
#include <QObject>
#include <QNetworkAccessManager>

class WebAppController : public QObject
{
    Q_OBJECT
public:
    explicit WebAppController(QObject *parent = nullptr);
    QNetworkAccessManager *manager;
    void getPageInfo()
        {
         manager->get(QNetworkRequest(QUrl("https://yandex.ru/maps/213/moscow/?l=trf%2Ctrfe&ll=37.622504%2C55.753215&source=traffic&z=10")));
        }
    void authorised()
    {
        const QString appID = "6935003";
        const QString protKey = "s0COizfqgVXpNgLOElel";
        const QString servKey = "0706b6840706b6840706b684f7076f675f007060706b6845badf607b71817241d6d2fd9";
    }

signals:

public slots:
    void onPageInfo(QNetworkReply *reply);//{}


};


//QString а в нем indexOf




#endif // WEBAPPCONTROLLER_H


/*https://oauth.vk.com/authorize?
client_id=6935003&
redirect_uri=https://oauth.vk.com/blank.html&
display=mobile&
scope=friends&
response_type=token
&v=5.92*/
