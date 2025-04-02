#include "backendhelper.h"

BackendHelper::BackendHelper(QObject *parent)
    : QObject{parent}
{
    m_selectedSection = 0;
}

int BackendHelper::selectedSection() const
{
    return m_selectedSection;
}

void BackendHelper::setSelectedSection(int newSelectedSection)
{
    if (m_selectedSection == newSelectedSection)
        return;
    m_selectedSection = newSelectedSection;
    emit selectedSectionChanged();
}

QString BackendHelper::getSelectedName()
{
    switch(m_selectedSection) {
    case 0:
        return QString("Dashboard");
        break;
    case 1:
        return QString("Collection");
        break;
    case 2:
        return QString("Statistics");
        break;
    case 3:
        return QString("My Posts");
        break;
    case 4:
        return QString("Admin Panel");
    default:
        return QString();
    }
}
