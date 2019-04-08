#include "webappcontroller.h"
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>

WebAppController::WebAppController(QObject *parent) : QObject(parent)
{
    manager = new QNetworkAccessManager(this);
    connect(manager, &QNetworkAccessManager::finished, this, &WebAppController::onPageInfo);
    /*QNetworkReply *reply = manager->get(QNetworkRequest(QUrl("https://oauth.vk.com/authorize"
                                                             "?client_id=" + appID
                                                             + "redirect_uri=https://oauth.vk.com/blank.html"
                                                             "display=mobile"
                                                             "scope=friends"
                                                             "response_type=token"
                                                             "v=5.92")));*/
    }

void WebAppController::onPageInfo(QNetworkReply *reply)
{
    //QString A="https://yandex.ru/maps/213/moscow/?l=trf%2Ctrfe&ll=37.730625%2C55.771082&z=13";
    //ui->textEdit->insertPlainText(A+"\n");
    qDebug()<<reply->url();
    qDebug()<<reply->rawHeaderList();
    //qDebug()<<reply->readAll();
    QString rep = reply->readAll();
    int j = 0;
    while ((j = rep.indexOf("traffic-routes-panel-view__dropdown-title", j)) != -1) {
        qDebug() << "Пробки в баллах:" << j;
        qDebug() << rep.mid(j + 35,250);
        ++j;
        }
}
//<div class="traffic-routes-panel-view__dropdown-title">Пробки 2 балла</div>

//https://oauth.vk.com/blank.html#access_token=68198cdad65d59d06ba5808739f3c9747d629c3b2fef31f6bfcff8c0ba0a609de7e2baadef641173def41&expires_in=86400&user_id=96923437

//вывести текст в TextEdit
//QString A="Your string";
//ui->textEdit->insertPlainText(A+"\n");
