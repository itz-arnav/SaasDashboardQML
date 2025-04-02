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
