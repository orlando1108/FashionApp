#include "apputils.h"

AppUtils::AppUtils(QObject *parent) : QObject(parent)
{

    m_imagePath = QStandardPaths::standardLocations(QStandardPaths::PicturesLocation).first();

    emit imagePathChanged();
}
