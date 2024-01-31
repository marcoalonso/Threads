//
//  AlertItem.swift
//  AppetizersMMVMSwiftUIDemo
//
//  Created by Marco Alonso Rodriguez on 05/06/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button?
}

enum AlertContext {
    
    //MARK: - Network Errors
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                            message: Text("There is an error trying to reach the server. If this persists, please contact support."),
                                            dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Please try again or contact support."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("The data received from the server was invalid. Please try again or contact support."),
                                            dismissButton: .default(Text("Ok")))
    static let decodingError      = AlertItem(title: Text("Internal Error"),
                                            message: Text("The data received from the server was in bad format. Please contact support."),
                                            dismissButton: .default(Text("Ok")))
    static let loginError      = AlertItem(title: Text("Error al iniciar sesion"),
                                            message: Text("El correo que ingresaste no existe o está mal escrito"),
                                            dismissButton: .default(Text("OK")))
    
    static let passwordInvalid      = AlertItem(title: Text("Error al iniciar sesion"),
                                            message: Text("La contraseña es incorrecta."),
                                            dismissButton: .default(Text("OK")))
    static let emailInvalid      = AlertItem(title: Text("Error al iniciar sesion"),
                                            message: Text("El correo electrónico está mal escrito."),
                                            dismissButton: .default(Text("OK")))

    static let emailInvalidR      = AlertItem(title: Text("Error al crear nueva cuenta"),
                                            message: Text("Debes de ingresar un correo válido."),
                                            dismissButton: .default(Text("OK")))

    static let minimunLenghtPassword      = AlertItem(title: Text("Error al crear nueva cuenta."),
                                            message: Text("La contraseña deberá de contener al menos 6 caracteres."),
                                            dismissButton: .default(Text("OK")))
    static let accountInUse      = AlertItem(title: Text("Error al crear nueva cuenta."),
                                            message: Text("El correo electrónico ingresado ya esta registrado."),
                                            dismissButton: .default(Text("OK")))
    
    
}
