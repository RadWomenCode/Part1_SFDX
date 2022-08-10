/**
 * Sorts the App Menu so preferred apps are on top
 */
final List<String> firstAppNames = new List<String>{
    'Professional_Pantry'
};

Map<String, Id> applicationIdsByName = new Map<String, Id>();
for (String firstAppName : firstAppNames) {
    applicationIdsByName.put(firstAppName, (Id) null);
}

final List<Id> firstApplicationIds = new List<Id>();
final List<Id> lastApplicationIds = new List<Id>();

for (Schema.AppMenuItem appMenuItem : [
    SELECT Id, ApplicationId, Name
    FROM AppMenuItem
    WHERE IsAccessible = TRUE
    ORDER BY SortOrder
]) {
    if (applicationIdsByName.keySet().contains(appMenuItem.Name)) {
        applicationIdsByName.put(appMenuItem.Name, appMenuItem.ApplicationId);
    } else {
        lastApplicationIds.add(appMenuItem.ApplicationId);
    }
}

for (String firstAppName : firstAppNames) {
    final Id applicationId = applicationIdsByName.get(firstAppName);
    if (applicationId != null) {
        firstApplicationIds.add(applicationId);
    }
}

final List<String> sortedApplicationIds = new List<Id>();
sortedApplicationIds.addAll(firstApplicationIds);
sortedApplicationIds.addAll(lastApplicationIds);

// Re-order the App Menu
AppLauncher.AppMenu.setOrgSortOrder(sortedApplicationIds);