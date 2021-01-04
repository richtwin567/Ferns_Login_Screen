import QtQuick 2.12

ListModel{
    id: systemControls

    Component.onCompleted: {
        if(config.ShutdownEnabled.toLowerCase()==="true"){
            append({
                       name: "Shutdown",
                       pathToIcon: "../assets/shutdown.svgz"

                   });
        }
        if(config.RestartEnabled.toLowerCase()==="true"){
            append({
                       name: "Restart",
                       pathToIcon: "../assets/restart.svgz"

                   });
        }
        if(config.SuspendEnabled.toLowerCase()==="true"){
            append({
                       name:"Suspend",
                       pathToIcon: "../assets/suspend.svgz"
                   });
        }
        if(config.HibernateEnabled.toLowerCase()==="true"){
            append({
                       name:"Hibernate",
                       pathToIcon: "../assets/hibernate.svgz"
                   });
        }
        if(config.HybridSleepEnabled.toLowerCase()==="true"){
            append({
                       name:"Hybrid Sleep",
                       pathToIcon: "../assets/hybrid_sleep.svgz"
                   });
        }
    }
}
