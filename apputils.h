#ifndef APPUTILS_H
#define APPUTILS_H

#include <QObject>
#include <QStandardPaths>


class AppUtils : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString imagePath MEMBER m_imagePath NOTIFY imagePathChanged)
public:
    explicit AppUtils(QObject *parent = nullptr);

signals:
    void imagePathChanged();

public slots:

private:
    QString m_imagePath ="";
};

#endif // APPUTILS_H
