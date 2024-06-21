//
//  NotesTopToolBar.swift
//  GSNotes
//
//  Created by Gaganjot Singh on 29/05/24.
//

import SwiftUI

struct NotesTopToolBar: View {
    var body: some View {
        HStack {
            Spacer()

            Menu {
                HStack {
                    Button {
                        print("Test")
                    } label: {
                        Image(systemName: "list.bullet")
                        Text("View as List")
                    }
                    Divider()
                    Button {
                        print("Test")
                    } label: {
                        Image(systemName: "checkmark.circle")
                        Text("Select Notes")
                    }
                    Button {
                        print("Test")
                    } label: {
                        Menu {
                            Button {
                                print("Test")
                            } label: {
                                Text("Default (Date Edited)")
                            }
                            Button {
                                print("Test")
                            } label: {
                                Text("Date Edited")
                            }
                            Button {
                                print("Test")
                            } label: {
                                Text("Date Created")
                            }
                            Button {
                                print("Test")
                            } label: {
                                Text("Title")
                            }
                            Divider()
                            Button {
                                print("Test")
                            } label: {
                                Text("Newest First")
                            }
                            Button {
                                print("Test")
                            } label: {
                                Text("Oldest First")
                            }
                        } label: {
                            Text("Sort By")
                            Image(systemName: "arrow.up.arrow.down")
                        }
                    }
                    Button {
                        print("Test")
                    } label: {
                        Menu {
                            Button {
                                print("Test")
                            } label: {
                                Text("Default (On)")
                            }
                            Button {
                                print("Test")
                            } label: {
                                Text("On")
                            }
                            Button {
                                print("Test")
                            } label: {
                                Text("Off")
                            }

                        } label: {
                            Text("Group By Date")
                            Image(systemName: "calendar")
                        }
                    }
                    Button {
                        print("Test")
                    } label: {
                        Text("View Attachments")
                        Image(systemName: "paperclip")
                    }
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    NotesTopToolBar()
}
