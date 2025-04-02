#ifndef BACKENDHELPER_H
#define BACKENDHELPER_H

#include <QObject>
#include <QQmlEngine>

class BackendHelper : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
public:
    explicit BackendHelper(QObject *parent = nullptr);
    Q_PROPERTY(int selectedSection READ selectedSection WRITE setSelectedSection NOTIFY selectedSectionChanged FINAL)

    int selectedSection() const;
    void setSelectedSection(int newSelectedSection);
    Q_INVOKABLE QString getSelectedName();

signals:
    void selectedSectionChanged();
private:
    int m_selectedSection;
};

#endif // BACKENDHELPER_H
