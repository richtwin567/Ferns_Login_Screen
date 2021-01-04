import QtQuick 2.12

ListModel{
    id: systemControls

    Component.onCompleted: {
        if(sddm.canPowerOff && config.ShutdownEnabled.toLowerCase()==="true"){
            append({
                       name: "Shutdown",
                       pathToIcon: "../assets/shutdown.svgz"

                   });
        }
        if(sddm.canReboot && config.RestartEnabled.toLowerCase()==="true"){
            append({
                       name: "Restart",
                       pathToIcon: "../assets/restart.svgz"

                   });
        }
        if(sddm.canSuspend && config.SuspendEnabled.toLowerCase()==="true"){
            append({
                       name:"Suspend",
                       pathToIcon: "../assets/suspend.svgz"
                   });
        }
        if(sddm.canHibernate && config.HibernateEnabled.toLowerCase()==="true"){
            append({
                       name:"Hibernate",
                       pathToIcon: "../assets/hibernate.svgz"
                   });
        }
        if(sddm.canHybridSleep && config.HybridSleepEnabled.toLowerCase()==="true"){
            append({
                       name:"Hybrid Sleep",
                       pathToIcon: "../assets/hybrid_sleep.svgz"
                   });
        }
    }
}
