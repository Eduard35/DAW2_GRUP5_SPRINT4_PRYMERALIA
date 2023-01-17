from kivy.lang import Builder
from kivymd.app import MDApp
from kivymd.uix.boxlayout import MDBoxLayout
from kivymd.theming import ThemableBehavior
from kivymd.uix.list import MDList, IconLeftWidget
from kivymd.uix.list import OneLineIconListItem
from kivy.uix.scrollview import ScrollView
from kivy.core.window import Window
from kivy.utils import platform
from kivymd.uix.screen import MDScreen
from kivy.properties import ObjectProperty
from kivymd.uix.scrollview import MDScrollView
from kivy.clock import Clock
from kivymd.uix.list import ThreeLineIconListItem

import json
from kivy.uix.boxlayout import BoxLayout

from kivymd.uix.button import MDFloatingActionButton
from kivy.uix.camera import Camera

class ContentNavigationDrawer(MDBoxLayout):
    manager = ObjectProperty()
    nav_drawer = ObjectProperty()  

class DrawerList(ThemableBehavior, MDList):
    def set_color_item(self, instance_item):

        # Set the color of the icon and text for the menu item.
        for item in self.children:
            if item.text_color == self.theme_cls.primary_color:
                item.text_color = self.theme_cls.text_color
                break
        instance_item.text_color = self.theme_cls.primary_color
        

        


class MyApp(MDApp):
    def build(self):
        self.title = "PymeShield"
        Window.size = (400, 600)

        return Builder.load_file("main2.kv")

    def on_start(self):
        scroll = ScrollView()
        
        # Leer los datos del archivo "inventory.json"
        with open("json/inventory.json", "r") as f:
            inventory = json.load(f)

        # Crear el layout principal
        layout = BoxLayout()
        layout.add_widget(scroll)

        # Crear la lista y añadir los elementos
        self.list = layout

        for device in inventory:
            item = ThreeLineIconListItem(
                IconLeftWidget(
                    icon="laptop",
                ),
                text=f"Dispositiu: {device['id_inventory']}",
                secondary_text=f"Num Inv: {device['inventory_number']}",
                tertiary_text=f"ID Disp: {device['id_device']}"
            )

            self.root.ids.list.add_widget(item)

        # obtenir la pantalla inventari
        current_screen = self.root.ids.screen_manager.get_screen("Inventari")

        if current_screen:
            # agregar el botó flotant del QR
            camera_button = MDFloatingActionButton(
                icon="camera",
                pos_hint={"center_x": 0.9, "center_y": 0.1},
                on_release=self.open_camera
            )
        
        # agregar botó flotant
        current_screen.add_widget(camera_button)

        # retornem la llista de dispositius
        return layout

    def open_camera(self, *args):
        # obtenir la pantalla del qr
        current_screen = self.root.ids.screen_manager.get_screen("QR")
        # redireccionar a la pantalla qrW
        self.root.ids.screen_manager.current = "QR"
        # crea una instancia de la aamera
        self.camera = Camera(index=0)
        # agregar la camara a la vista actual
        current_screen.add_widget(self.camera)
        # iniciar la camara
        self.camera.play = True
        # missatge informatiu
        print("Obrint la cámara...")

    def close_camera(self):
        # detener la reproducción de la cámara
        self.camera.play = False
        # eliminar el widget de la cámara de la pantalla actual
        current_screen = self.root.ids.screen_manager.get_screen("QR")
        current_screen.remove_widget(self.camera)
        # eliminar la referencia a la instancia de la cámara
        del self.camera
        # redirigir a la pantalla de inventario
        self.root.ids.screen_manager.current = "Inventari"
        # missatge informatiu
        print("Tancant la cámara...")
        
MyApp().run()
